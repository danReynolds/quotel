class WelcomeController < ApplicationController
  def index
    if params[:source]
      @quotes = Quote.where(source: params[:source])
    else
      @quotes = Quote.where(source: Quote::FLATTERY)
    end
    @sample = [@quotes.sample,@quotes.sample]
    @feeds = Quote.order("RANDOM()").first(20)
  end
end
