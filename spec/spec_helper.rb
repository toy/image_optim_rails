# frozen_string_literal: true

require 'image_optim/pack'
require 'image_optim/path'

ENV['PATH'] = [
  ImageOptim::Pack.path,
  ENV['PATH'],
].compact.join File::PATH_SEPARATOR

RSpec.configure do |c|
  c.before do
    stub_const('ImageOptim::Config::GLOBAL_PATH', ImageOptim::Path::NULL)
    stub_const('ImageOptim::Config::LOCAL_PATH', ImageOptim::Path::NULL)
    ImageOptim.class_eval{ def pack; end }
  end

  c.order = :random
end

def flatten_animation(image)
  if image.image_format == :gif
    flattened = image.temp_path
    command = %W[
      convert
      #{image.to_s.shellescape}
      -coalesce
      -append
      #{flattened.to_s.shellescape}
    ].join(' ')
    expect(ImageOptim::Cmd.run(command)).to be_truthy
    flattened
  else
    image
  end
end

def mepp(image_a, image_b)
  coalesce_a = flatten_animation(image_a)
  coalesce_b = flatten_animation(image_b)
  command = %W[
    compare
    -metric MEPP
    -alpha Background
    #{coalesce_a.to_s.shellescape}
    #{coalesce_b.to_s.shellescape}
    #{ImageOptim::Path::NULL}
    2>&1
  ].join(' ')
  output = ImageOptim::Cmd.capture(command)
  unless [0, 1].include?($CHILD_STATUS.exitstatus)
    fail "compare #{image_a} with #{image_b} failed with `#{output}`"
  end

  num_r = '\d+(?:\.\d+(?:[eE][-+]?\d+)?)?'
  output[/\((#{num_r}), #{num_r}\)/, 1].to_f
end

RSpec::Matchers.define :be_smaller_than do |expected|
  match{ |actual| actual.size < expected.size }
end

RSpec::Matchers.define :be_similar_to do |expected, max_difference|
  match do |actual|
    @diff = mepp(actual, expected)
    @diff <= max_difference
  end
  failure_message do |actual|
    "expected #{actual} to have at most #{max_difference} difference from "\
        "#{expected}, got normalized root-mean-square error of #{@diff}"
  end
end
