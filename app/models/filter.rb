class Filter < ActiveRecord::Base

  attr_accessible :published, :title


  scope :published, -> { where(published: true) }
end
