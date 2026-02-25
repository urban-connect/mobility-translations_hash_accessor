# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "rake"
gem "rspec"
gem "standard"

ar_version = ENV["ACTIVE_RECORD_VERSION"]
gem "activerecord", ar_version ? "~> #{ar_version}" : ">= 7.2"
gem "sqlite3"
