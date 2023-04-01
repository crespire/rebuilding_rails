class TestController < Rulers::Controller
  def index
    render :index, string: "The index route"
  end

  def secret
    "We found a secret!"
  end
end
