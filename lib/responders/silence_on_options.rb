# frozen_string_literal: true

module Responders
  class SilenceOnOptions
    OPTIONS = %w(
      --all
      --doc-dir
      --dump
      --format
      --gems
      --home
      --interactive
      --list
      --list-doc-dirs
      --no-all
      --no-gems
      --no-home
      --no-interactive
      --no-list
      --no-list-doc-dirs
      --no-pager
      --no-profile
      --no-site
      --no-standard-docs
      --no-system
      --pager
      --profile
      --server
      --site
      --system
      --width
      -T
      -a
      -d
      -f
      -i
      -l
      -w
    ).freeze

    def initialize(text, ri_doc: nil, bot_name: nil)
      @text = text
    end

    def apply?
      OPTIONS.any? { |pattern| text.lstrip.start_with?(pattern) }
    end

    def call
    end

    private

    def text
      @text || ""
    end
  end
end
