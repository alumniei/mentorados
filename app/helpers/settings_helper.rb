# frozen_string_literal: true

module SettingsHelper
  class Settings
    attr_accessor :cookies, :accept_language

    def initialize(cookies, accept_language)
      @cookies = cookies
      @accept_language = accept_language
    end

    def save(params)
      self.theme = params[:theme]
      self.locale = params[:locale]
    end

    def theme
      cookies[:_mentorados_theme] || 'system'
    end

    def locale
      cookies[:_mentorados_locale]&.to_sym || default_locale
    end

    private

    def theme=(theme)
      set_cookie(:_mentorados_theme, theme)
    end

    def locale=(locale)
      set_cookie(:_mentorados_locale, locale)
    end

    def set_cookie(name, value)
      cookies[name] = { value: value, expires: 1.year.from_now }
    end

    def default_locale
      accepted = accept_language
        .split(',')
        .map { |language| "#{language.strip};q=1".split(';') }
        .map { |(locale, q)| [locale.strip, q.split('=')[1].to_i] }

      %w[pt en]
        .map { |locale| [locale, accepted.select { |(loc, _)| loc.start_with?(locale) }.map { |(_, q)| q }.max || 0] }
        .max_by(&:last)
        .first
    end
  end
end
