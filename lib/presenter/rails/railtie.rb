module Presenter
  class Railtie < Rails::Railtie

    # We need to eager load the presenters before models, so that the associated model gets the
    # presenter method available. The `to_prepare` block reloads the presenters on any change made
    # whenever 'cache_classes' is set to false (development env). However, in case of the
    # production env, it has no impact as it eager loads models, etc.

    config.to_prepare do
      Dir[Rails.root.join('app', 'presenters', '*.rb')].each do |file|
        begin
          name = File.basename(file, '.rb').classify
          Object.send(:remove_const, name.to_sym)
        rescue NameError
        ensure
          load file
        end
      end
    end

  end
end
