class Stock < ApplicationRecord
has_many :user_stocks
has_many :users, through: :user_stocks


def self.find_by_ticker(symbol)

	where(ticker: symbol).first

end

def self.new_lookup(symbol)
	
looked_up = StockQuote::Stock.quote(symbol)
return nil unless looked_up.company_name

new_stock = new(ticker: looked_up.symbol, name: looked_up.company_name) 

new_stock.close_price = new_stock.price
new_stock

end

def price
	StockQuote::Stock.new(api_key: 'sk_55cd0160ffd447c1b0ddf9c9a4ae1685')
closing_price = StockQuote::Stock.quote(ticker).latest_price
return "#{closing_price}, (closing)" if closing_price

open_price = StockQuote::Stock.quote(ticker).open
return "#{open_price}, (open)" if open_price
'Unavailable'
	end

	

end
