class WelcomeController < ApplicationController
  def index
    if params[:source]
      @quotes = Quote.where(source: params[:source])
    else
      @quotes = Quote.where(source: Quote::FLATTERY)
    end
    @sample = @quotes.sample
    @week_winner = @quotes.order('up DESC').first
  end
end
