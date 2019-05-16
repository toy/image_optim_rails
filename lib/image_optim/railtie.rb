# frozen_string_literal: true

require 'image_optim'

class ImageOptim
  # Adds image_optim as preprocessor for gif, jpeg, png and svg images
  class Railtie < Rails::Railtie
    MIME_TYPES = %w[
      image/gif
      image/jpeg
      image/png
      image/svg+xml
    ].freeze

    config.before_configuration do |app|
      worker_names = ImageOptim::Worker.klasses.map(&:bin_sym)
      app.config.assets.image_optim =
        ActiveSupport::OrderedOptions.new do |hash, key|
          if worker_names.include?(key.to_sym)
            hash[key] = ActiveSupport::OrderedOptions.new
          end
        end
      app.config.assets.image_optim.merge!(default_options(app))
    end

    initializer 'image_optim.initializer' do |app|
      next if app.config.assets.compress == false
      next if app.config.assets.image_optim == false

      @image_optim = ImageOptim.new(options(app))

      register_preprocessor(app) do |*args|
        if args[1] # context and data arguments in sprockets 2
          optimize_image_data(args[1])
        else
          input = args[0]
          {
            :data => optimize_image_data(input[:data]),
            :charset => nil, # no gzipped version with rails/sprockets#228
          }
        end
      end
    end

    def options(app)
      if app.config.assets.image_optim == true
        default_options(app)
      else
        app.config.assets.image_optim || default_options(app)
      end
    end

    def default_options(app)
      config_path = app.config.paths['config'].first
      tmp_path = app.config.paths['tmp'].first
      {
        :config_paths => [
          "#{config_path}/image_optim.yml",
          "#{config_path}/image_optim/#{Rails.env}.yml",
        ],
        :cache_dir => "#{tmp_path}/cache/image_optim",
      }
    end

    def optimize_image_data(data)
      @image_optim.optimize_image_data(data) || data
    end

    def register_preprocessor(app, &processor)
      MIME_TYPES.each do |mime_type|
        if app.assets
          app.assets.register_preprocessor mime_type, :image_optim, &processor
        else
          app.config.assets.configure do |env|
            if Sprockets::Processing.instance_method(:register_config_processor).arity == -3
              env.register_preprocessor mime_type, &processor
            else
              env.register_preprocessor mime_type, :image_optim, &processor
            end
          end
        end
      end
    end
  end
end
