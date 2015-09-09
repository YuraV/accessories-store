class SubFolder < ActiveRecord::Base
  attr_accessible :published, :title

  belongs_to :category
end
