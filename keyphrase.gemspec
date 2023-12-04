# frozen_string_literal: true

require_relative "lib/keyphrase/version"

Gem::Specification.new do |spec|
  spec.name = "keyphrase"
  spec.version = Keyphrase::VERSION
  spec.authors = ["Ben D'Angelo"]
  spec.email = ["ben@bendangelo.me"]

  spec.summary = "Extracts keywords from texts using a stoplist and some magic."
  spec.description = "Implementation of the Rapid Automatic Keyword Extraction (RAKE) algorithm in Ruby. Forked from the original rake_text gem."
  spec.homepage = "https://github.com/bendangelo/keyphrase"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bendangelo/keyphrase"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"

end
