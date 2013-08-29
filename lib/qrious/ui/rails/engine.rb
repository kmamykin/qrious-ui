module Qrious
  module Ui
    # All we’re doing here is declaring the gem as an engine.
    # This will cause rails to add its directories to the load path when the gem is required.
    module Rails
      class Engine < ::Rails::Engine
      end
    end
  end
end
