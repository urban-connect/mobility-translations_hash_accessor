# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mobility::Plugins::TranslationsHashAccessor do
  describe "_translations_hash methods" do
    it "defines {attribute}_translations_hash methods on the model" do
      article = Article.new

      expect(article).to respond_to(:title_translations_hash)
      expect(article).to respond_to(:body_translations_hash)
    end

    it "returns a hash with locale keys and translation values" do
      article = Article.new
      article.title_en = "Hello"
      article.title_de = "Hallo"

      expect(article.title_translations_hash).to eq(en: "Hello", de: "Hallo")
    end

    it "compacts nil values" do
      article = Article.new
      article.title_en = "Hello"

      expect(article.title_translations_hash).to eq(en: "Hello")
    end

    it "returns an empty hash when no translations are set" do
      article = Article.new

      expect(article.title_translations_hash).to eq({})
    end
  end

  describe "custom locale list" do
    before do
      stub_const("ArticleWithCustomLocales", Class.new(ActiveRecord::Base) {
        self.table_name = "articles"

        extend Mobility

        translates :title, backend: :jsonb, translations_hash_accessor: [:en]
      })
    end

    it "only includes specified locales" do
      article = ArticleWithCustomLocales.new
      article.title_en = "Hello"
      article.title_de = "Hallo"

      expect(article.title_translations_hash).to eq(en: "Hello")
    end
  end
end
