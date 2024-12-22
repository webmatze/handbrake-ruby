require 'shellwords'
require 'handbrake/presets'
require 'handbrake/progress'

module Handbrake
  class Transcoder
    attr_accessor :input_file, :output_file
    attr_accessor :video_quality, :video_encoder
    attr_accessor :audio_quality, :audio_encoder
    attr_accessor :width, :height
    attr_accessor :preset

    def initialize(input: nil, output: nil)
      @input_file = input
      @output_file = output
      @video_encoder = 'x264'
      @video_quality = 20
      @audio_encoder = 'ca_aac'
      @audio_quality = 160
      @preset = 'normal'
    end

    def transcode(&progress_block)
      validate_files!
      cmd = build_command

      IO.popen(cmd) do |io|
        while line = io.gets
          progress = Handbrake::Progress.new(line)
          progress_block.call(progress) if block_given?
        end
      end
    end

    def set_size(width:, height:)
      @width = width
      @height = height
    end

    def use_preset(name)
      @preset = name
    end

    private

    def validate_files!
      raise 'Input file not specified' unless @input_file
      raise 'Output file not specified' unless @output_file
      raise 'Input file does not exist' unless File.exist?(@input_file)
    end

    def build_command
      cmd = ['HandBrakeCLI']
      cmd << "-i #{@input_file.shellescape}"
      cmd << "-o #{@output_file.shellescape}"
      cmd << "-e #{@video_encoder}" if @video_encoder
      cmd << "-q #{@video_quality}" if @video_quality
      cmd << "-B #{@audio_quality}" if @audio_quality
      cmd << "-E #{@audio_encoder}" if @audio_encoder
      cmd << "-w #{@width}" if @width
      cmd << "-l #{@height}" if @height
      cmd << "-Z #{Presets::AVAILABLE[@preset].shellescape}" if @preset

      cmd.join(' ')
    end
  end
end
