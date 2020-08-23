class StocksController <ApplicationController
def search
	StockQuote::Stock.new(api_key: 'sk_55cd0160ffd447c1b0ddf9c9a4ae1685')
	if params[:stock]

		@stock = Stock.find_by_ticker(params[:stock])
		@stock ||= Stock.new_lookup(params[:stock])

	end

	if @stock
		render partial: 'lookup'

	else
		render status: :not_found, nothing: true

 end
end

end