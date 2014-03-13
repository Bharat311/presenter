module Presenter
  class BasePresenter
    extend Presenter::Delegator

    def initialize(resource)
      @_presentable_resource = resource
    end

    class << self
      def presents(klass_name)
        resource_klass(klass_name)
        setup_resource_klass
        define_resource_getter
      end

      private

        def resource_klass(klass_name = nil)
          @_presentable_resource_klass ||= klass_name.to_s.classify.constantize
        end

        def setup_resource_klass
          resource_klass.send(:include, Presenter::Presentable)
          resource_klass.class_variable_set('@@_presenter_class', name)
        end

        # Can we avoid using class_eval here?

        def define_resource_getter
          class_eval <<-eos
            def #{resource_klass.name.demodulize.underscore}
              @_presentable_resource
            end
          eos
        end

    end
  end
end
