# best_quotes/config/application.rb
require "rulers"
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "public")

module BestQuotes
  class Application < Rulers::Application
  end
end
