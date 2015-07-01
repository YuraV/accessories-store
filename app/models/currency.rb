class Currency < ActiveRecord::Base

  attr_accessible :iso, :rate

  scope :by, -> (iso) { where(iso: iso) }


end
