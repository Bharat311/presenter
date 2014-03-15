module Presenter
  module ViewHelpers

    delegate :translate, :t, :localize, :l, to: :helper

    def helper
      ApplicationController.helpers
    end
    alias_method :h, :helper

    def routes
      Rails.application.routes.url_helpers
    end
    alias_method :r, :routes

  end
end
