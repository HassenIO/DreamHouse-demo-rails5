class Property < ApplicationRecord

  geocoded_by :address

  belongs_to :user

  validates_presence_of :title, :address, :price, :description

  after_validation :geocode, if: :address_changed?

end
