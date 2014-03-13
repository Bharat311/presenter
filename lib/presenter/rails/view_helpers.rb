module Presenter
  module ViewHelpers

    def helper
      ApplicationController.helpers
    end
    alias_method :h, :helper

    def translate(key, options = {})
      ::I18n.translate(key, options)
    end
    alias_method :t, :translate

    def router
      Rails.application.routes.url_helpers
    end
    alias_method :r, :router

  end
end
