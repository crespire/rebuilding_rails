# frozen_string_literal: true

# best_quotes/app/controllers/quotes_controller.rb

class QuotesController < Rulers::Controller
  def a_quote
    render(:a_quote, noun: :winking)
  end

  def instance_quote
    @noun = "shouting"
    render(:instance_quote)
  end

  def exception
    raise "It's a bad one!"
  end

  def quote_file
    quote_1 = FileModel.find(1)
    quote_1.data
    render(:quote, obj: quote_1)
  end

  def index
    quotes = FileModel.all
    render(:index, quotes: quotes)
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "We doin' it live.",
      "attribution" => "Bill O'Reily",
    }
    m = FileModel.create(attrs)
    render(:quote, obj: m)
  end
end
