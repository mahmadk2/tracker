class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :user_stocks
         has_many :stocks, through: :user_stocks
         has_many :friendships
         has_many :friends, through: :friendships


      def full_name
          return "#{f_name} #{l_name}".strip if (f_name || l_name)
          "anonymous"
      end

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

    def not_friends_with?(friend_id)

friendships.where(friend_id: friend_id).count < 1

end

def except_current_user(users)

users.reject {|user| user.id == self.id}

end

def self.search(param)

return User.none if param.blank?

param.strip!

param.downcase!

(first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq

end

def self.first_name_matches(param)

matches('f_name', param)

end

def self.last_name_matches(param)

matches('l_name', param)

end

def self.email_matches(param)

matches('email', param)

end

def self.matches(field_name, param)

where("lower(#{field_name}) like ?", "%#{param}%")

end

end
