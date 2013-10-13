class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find(params[:id])
  end
  
  # GET /quotes/new
  def new
    @quote = Quote.new
    @icons = ["icon-fighter-jet","icon-random","icon-plane","icon-comments", "icon-road", "icon-bullhorn"]
    @source = params[:source]
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    wits = ["It went through, but should it have?","Nice one.","I have heard better, but we'll take it.", "Classic. Submit like 10 more of those.","Hah, that one was hilarious.","Please tell me you have more of those."]
    respond_to do |format|
      if @quote.save
        format.html { redirect_to root_url(source: @quote.source), notice: wits.sample }
      else
        @source = @quote.source
        @icons = ["icon-fighter-jet","icon-random","icon-plane","icon-comments", "icon-road", "icon-bullhorn"]
        format.html { render action: 'new'}
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
  end
  
  def view_all
    @all_quotes = Quote.all.order('up DESC')
    @recent_quotes = @all_quotes.select{|q| q.created_at.to_date >= Date.today - 7.days}
    @week_winners = [@recent_quotes.select{|q| q.source == Quote::FLATTERY}.first, @recent_quotes.select{|q| q.source == Quote::INSULT}.first, @recent_quotes.select{|q| q.source == Quote::FLATINSULT}.first]
  end
  
  def rank
    quote = Quote.find(params[:id])
    new_quote = Quote.where(source: quote.source).order("RANDOM()").first
  
    if params[:direction] == "up"
      quote.up += 1
    else
      quote.down += 1
    end
    
    if quote.save
      respond_to do |format|
        format.json do
          result = {
            new_quote_id: new_quote.id,
            new_quote_description: new_quote.description,
            number: params[:number]
          }
          render json: result
        end
      end
    else
      puts "it broke it broke it broke!"
    end
      
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:description, :author, :source, :up, :down)
    end
end
