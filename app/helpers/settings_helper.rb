# frozen_string_literal

module SettingsHelper
  class Settings
    attr_accessor :cookies

    def initialize(cookies)
      @cookies = cookies
    end

    def save(params)
      self.theme = params[:theme]
      self.language = params[:language]
    end

    def theme
      cookies[:_mentorados_theme]
    end

    def language
      cookies[:_mentorados_language]&.to_sym
    end

    private

    def theme=(theme)
      set_cookie(:_mentorados_theme, theme)
    end

    def language=(language)
      set_cookie(:_mentorados_language, language)
    end

    def set_cookie(name, value)
      cookies[name] = {value: value, expires: 1.year.from_now}
    end
  end
end
