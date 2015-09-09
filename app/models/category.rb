class Category < ActiveRecord::Base
  attr_accessible :published, :title

  has_many :products
  has_many :filters
  has_many :sub_folders
end
