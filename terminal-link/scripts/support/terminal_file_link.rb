#!/usr/bin/env ruby
# frozen_string_literal: true

require "cgi"
require "shellwords"
require "yaml"

module TerminalFileLink
  module_function

  IMAGE_EXTENSIONS = %w[.png .jpg .jpeg .webp .gif].freeze
  CONFIG_PATH = File.expand_path("../../config.yaml", __dir__)

  def file_link_lines(path:, kind: "auto", fallback_label: nil)
    absolute_path = File.expand_path(path)
    raise ArgumentError, "File not found: #{absolute_path}" unless File.exist?(absolute_path)

    resolved_kind = resolve_kind(absolute_path, kind)
    preferences = config

    return [absolute_path] unless osc8_supported?(preferences) && prefer_osc8?(preferences)

    label = fallback_label || default_label_for(resolved_kind, preferences)
    lines = [osc8_link(file_uri(absolute_path), label)]
    lines << "open #{Shellwords.escape(absolute_path)}" if macos? && include_open_fallback?(preferences)
    lines
  end

  def resolve_kind(path, kind)
    return kind unless kind == "auto"

    IMAGE_EXTENSIONS.include?(File.extname(path).downcase) ? "image" : "file"
  end

  def default_label_for(kind, preferences)
    link_preferences = preferences.fetch("link", {})
    return link_preferences["default_image_label"] if kind == "image" && link_preferences["default_image_label"]
    return link_preferences["default_file_label"] if kind == "file" && link_preferences["default_file_label"]

    kind == "image" ? "[Open image]" : "[Open file]"
  end

  def config
    return {} unless File.exist?(CONFIG_PATH)

    YAML.load_file(CONFIG_PATH) || {}
  rescue Psych::SyntaxError
    {}
  end

  def prefer_osc8?(preferences)
    link_preferences = preferences.fetch("link", {})
    link_preferences.fetch("prefer_osc8", true)
  end

  def osc8_supported?(preferences)
    link_preferences = preferences.fetch("link", {})
    link_preferences.fetch("osc8_supported", true)
  end

  def include_open_fallback?(preferences)
    link_preferences = preferences.fetch("link", {})
    link_preferences.fetch("include_open_fallback", false)
  end

  def macos?
    /darwin/i.match?(RUBY_PLATFORM)
  end

  def file_uri(path)
    "file://" + path.split("/").map { |segment| CGI.escape(segment).gsub("+", "%20") }.join("/")
  end

  def osc8_link(uri, label)
    "\e]8;;#{uri}\a#{label}\e]8;;\a"
  end
end
