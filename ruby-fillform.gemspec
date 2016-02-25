# -*- encoding: utf-8 -*-
basedir = File.expand_path(File.dirname(__FILE__))
require "#{basedir}/lib/ruby-fillform/version"

Gem::Specification.new do |s|
  s.name        = "ruby-fillform"
  s.version     = Ruby::Fillform::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Maurice Hadamczyk", "Carlos Josue Merlos"]
  s.email       = ["moessimple@googlemail.com", "carlosjomerlos@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{fill text through acroform fields, gem based in ruby-fillform}

  s.rubyforge_project = "ruby-fillform"

  s.files       = Dir.glob("{examples,lib, test}/**/**/*") +
                  Dir.glob("data/{encodings,images,pdfs}/*") +
                  ["Rakefile", "ruby-fillform.gemspec", "Gemfile"]
  s.test_files    = Dir[ "test/*.rb"]
  s.require_paths = "lib"

  s.add_dependency "prawn"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

