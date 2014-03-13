module Presenter
  class BasePresenter
    extend Forwardable

    def initialize(resource)
      @_presentable_resource = resource
    end

    class << self
      def presents(klass_name)
        klass = presentable_resource_class(klass_name)
        klass.send(:include, Presenter::Presentable)
        klass.class_variable_set('@@_presenter_class', name)
      end

      def presentable_resource_class(klass_name)
        klass_name.to_s.classify.constantize
      end

      def delegates(*args)
        if args.include?(:all)
          delegate_all
        else
          delegate_only *args
        end
      end

      private

        # Can we avoid using class_eval here?

        def delegate_only(*args)
          args.each do |method|
            class_eval <<-eos
              def_delegator :@_presentable_resource, :#{method}
            eos
          end
        end

        def delegate_all
          class_eval <<-eos
            def method_missing(method_name, *args)
              @_presentable_resource.send(method_name, *args)
            end
          eos
        end

    end
  end
end