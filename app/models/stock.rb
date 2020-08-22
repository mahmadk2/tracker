class Stock < ApplicationRecord

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
closing_price = StockQuote::Stock.quote(ticker).close
return "#{closing_price}, (closing)" if closing_price

open_price = StockQuote::Stock.quote(ticker).open
return "#{open_price}, (closing)" if open_price
'Unavailable'
	end

end
