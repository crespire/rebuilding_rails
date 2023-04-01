# best_quotes/app/controllers/quotes_controller.rb

class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end

  def instance_quote
    @noun = 'shouting'
    render :instance_quote
  end

  def exception
    raise "It's a bad one!"
  end
end

