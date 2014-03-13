module Presenter
  module Presentable

    def presenter
      @_presenter ||= presenter_class.send(:new, self)
    end

    def presenter_class
      self.class.class_variable_get('@@_presenter_class').constantize
    end

  end
end
