module Presenter
  module Delegator
    include Forwardable

    def delegates(*args)
      args.include?(:all) ? delegate_all : delegate_only(*args)
    end

    private

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
