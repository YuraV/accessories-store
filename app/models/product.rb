class Product < ActiveRecord::Base
  attr_accessible :currency, :description, :name, :price
end
