require 'presenter/delegator'
require 'presenter/presentable'

require 'presenter/base'

require 'presenter/version'

if defined? Rails
  require 'presenter/rails/view_helpers'
  require 'presenter/rails/railtie'
end

module Presenter
end
