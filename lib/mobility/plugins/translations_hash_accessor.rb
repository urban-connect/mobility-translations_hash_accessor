# frozen_string_literal: true

module Mobility
  module Plugins
    module TranslationsHashAccessor
      extend Plugin

      default true

      initialize_hook do |*names|
        if (locales = options[:translations_hash_accessor])
          locales = Mobility.available_locales if locales == true

          names.each do |name|
            define_translations_reader(name, locales)
          end
        end
      end

      private

      def define_translations_reader(name, locales)
        locales_array = locales.map(&:inspect).join(", ")

        module_eval <<-EOM, __FILE__, __LINE__ + 1
          def #{name}_translations_hash
            [ #{locales_array} ].to_h { |locale| [ locale, #{name}(locale: locale) ] }.compact
          end
        EOM
      end
    end

    register_plugin(:translations_hash_accessor, TranslationsHashAccessor)
  end
end
