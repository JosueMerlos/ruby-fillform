# encoding: utf-8
puts "Prawn specs: Running on Ruby Version: #{RUBY_VERSION}"

require "bundler"
Bundler.setup

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "/spec/"
  end
end

require_relative "../lib/ruby-fillform"

Prawn.debug = true

require "rspec"