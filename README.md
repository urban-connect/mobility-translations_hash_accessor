# mobility-translations_hash_accessor

A [Mobility](https://github.com/shioyama/mobility) plugin that adds `{attribute}_translations_hash` reader methods to your models. Each method returns a compact hash of `{ locale => translation }` pairs, useful for API serialization.

## Installation

Add to your Gemfile:

```ruby
gem "mobility-translations_hash_accessor"
```

Then run `bundle install`.

## Usage

Require the gem and enable the plugin in your Mobility configuration:

```ruby
require "mobility/translations_hash_accessor"

Mobility.configure do |config|
  config.plugins do
    backend :jsonb
    active_record
    reader
    writer
    translations_hash_accessor
  end
end
```

Define translated attributes on your model:

```ruby
class Article < ApplicationRecord
  extend Mobility

  translates :title, backend: :jsonb
  translates :body, backend: :jsonb
end
```

This generates `title_translations_hash` and `body_translations_hash` methods:

```ruby
article = Article.new(title_en: "Hello", title_de: "Hallo")

article.title_translations_hash
# => { en: "Hello", de: "Hallo" }
```

Nil values are automatically compacted:

```ruby
article = Article.new(title_en: "Hello")

article.title_translations_hash
# => { en: "Hello" }
```

### Custom locale list

By default the plugin uses `Mobility.available_locales`. You can pass an explicit list of locales per attribute:

```ruby
translates :title, backend: :jsonb, translations_hash_accessor: [:en, :de]
```

### Disabling the plugin per attribute

Pass `false` to skip generating the method for a specific attribute:

```ruby
translates :internal_notes, backend: :jsonb, translations_hash_accessor: false
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
