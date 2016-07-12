class Property < ApplicationRecord

  geocoded_by :address

  validates_presence_of :title, :address, :price, :description

  after_validation :geocode, if: :address_changed?

end
