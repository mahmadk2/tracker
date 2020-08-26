class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :user_stocks
         has_many :stocks, through: :user_stocks


     def add_stock?(symbol)
    
       stock_limit? && !add_already?(symbol)
     	
     end

     def stock_limit?

     (user_stocks.count <10)
     end

     def add_already?(symbol)

      stock = Stock.find_by_ticker(symbol)
      return false unless stock
      user_stocks.where(stock_id: stock.id).exists?
     end

end
