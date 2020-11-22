# frozen_string_literal

module SettingsHelper
  class Settings
    attr_accessor :cookies

    def initialize(cookies)
      @cookies = cookies
    end

    def save(params)
      self.theme = params[:theme]
      self.locale = params[:locale]
    end

    def theme
      cookies[:_mentorados_theme]
    end

    def locale
      cookies[:_mentorados_locale]&.to_sym
    end

    private

    def theme=(theme)
      set_cookie(:_mentorados_theme, theme)
    end

    def locale=(locale)
      set_cookie(:_mentorados_locale, locale)
    end

    def set_cookie(name, value)
      cookies[name] = {value: value, expires: 1.year.from_now}
    end
  end
end
