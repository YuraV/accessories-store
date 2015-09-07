class Filter < ActiveRecord::Base

  attr_accessible :published, :title
  attr_accessor :hidden_category

  scope :published, -> { where(published: true) }
end
