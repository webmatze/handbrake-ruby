# Handbrake Ruby

A Ruby wrapper for the HandBrake CLI video transcoder that provides an easy-to-use interface.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'handbrake-ruby'
```

And then execute:

    bundle install

Or install it yourself as:

    gem install handbrake-ruby

## Usage

```ruby
require 'handbrake'

# Simple usage
transcoder = Handbrake::Transcoder.new(
  input: "input.mkv",
  output: "output.mp4"
)
transcoder.transcode

# More detailed configuration
transcoder = Handbrake::Transcoder.new
transcoder.input_file = "input.mkv"
transcoder.output_file = "output.mp4"
transcoder.video_quality = 22
transcoder.video_encoder = "x264"
transcoder.audio_quality = 160
transcoder.set_size(width: 1280, height: 720)
transcoder.use_preset("Fast 1080p30")
transcoder.transcode
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/webmatze/handbrake-ruby>.

## License

The gem is available as open source under the terms of the MIT License.
