module Presenter
  module Presentable

    def presenter(opts = {})
      @_presenters ||= {}

      _type = opts[:as] || opts['as'] || :default
      @_presenters[_type] ||= instantiate_presenter(_type)
    end

    def instantiate_presenter(type)
      if type === :default
         default_presenter_class
      else
         (type.to_s.classify + "Presenter").constantize
      end.send(:new, self)
    end

    def default_presenter_class
      self.class.class_variable_get('@@_presenter_class').constantize
    end

  end
end
