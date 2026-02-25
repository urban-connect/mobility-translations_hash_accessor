# frozen_string_literal: true

require_relative "lib/mobility/translations_hash_accessor/version"

Gem::Specification.new do |spec|
  spec.name = "mobility-translations_hash_accessor"
  spec.version = Mobility::TranslationsHashAccessor::VERSION
  spec.authors = ["Urban Connect"]
  spec.email = ["dev@urban-connect.ch"]

  spec.summary = "Mobility plugin that generates _translations_hash reader methods"
  spec.description = "A Mobility plugin that adds {attribute}_translations_hash methods " \
                     "returning a compact hash of locale => translation pairs."
  spec.homepage = "https://github.com/urban-connect/mobility-translations_hash_accessor"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "mobility", "~> 1.3"
end
