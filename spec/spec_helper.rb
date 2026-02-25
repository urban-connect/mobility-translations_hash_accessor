# frozen_string_literal: true

require "active_record"
require "mobility"
require "mobility/translations_hash_accessor"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define do
  create_table :articles, force: true do |t|
    t.json :title, default: {}, null: false
    t.json :body, default: {}, null: false
  end
end

I18n.available_locales = [:en, :de]

Mobility.configure do |config|
  config.plugins do
    backend :jsonb
    active_record
    reader
    writer
    locale_accessors
    translations_hash_accessor
  end
end

class Article < ActiveRecord::Base
  extend Mobility

  translates :title, backend: :jsonb
  translates :body, backend: :jsonb
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run_when_matching :focus
  config.disable_monkey_patching!
  config.order = :random

  Kernel.srand config.seed
end
