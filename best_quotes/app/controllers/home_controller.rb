# best_quotes/app/controllers/home_controller.rb
#
class HomeController < Rulers::Controller
  def index
    "The home controller index"
  end

  def info
    render :display
  end
end
