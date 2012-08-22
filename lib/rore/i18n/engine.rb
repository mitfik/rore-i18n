require 'globalize3'

module RoreI18n
  class Engine < ::Rails::Engine

    config.to_prepare do
      ::ApplicationController.module_eval do

        def default_url_options(options={})
          {:locale => current_language }
        end

        def set_locale
          if defined?(params) && params[:locale]
            ::I18n.locale = params[:locale]
          elsif defined?(request)
            ::I18n.locale = extract_locale_from_accept_language_header
          end
          ::I18n.locale ||= ::I18n.default_locale
        end

        def set_locale_for_lang(lang)
          ::I18n.locale = lang
        end

        def extract_locale_from_accept_language_header
          request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first) || "en"
        end

        def current_language
          ::I18n.locale
        end

        def valid_languages
         @@valid_languages ||= Dir.glob(File.join(__FILE__, '../../config', 'locales', '*.yml')).collect {|f| File.basename(f).split('.').first}.collect(&:to_sym)
        end

        prepend_before_filter :set_locale
        protected :default_url_options, :set_locale
        helper_method :current_language
      end

      ::Product.class_eval do
        translates :name, :description, :product_keywords, :meta_keywords, :meta_description, :description_markup
        translation_class.send :serialize, :product_keywords
      end

      ::Property.class_eval do
        translates :display_name
      end
    end
  end
end
