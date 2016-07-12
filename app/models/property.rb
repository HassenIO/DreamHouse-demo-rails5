class Property < ApplicationRecord

  geocoded_by :address

  belongs_to :user

  validates_presence_of :title, :address, :price, :description

  after_validation :geocode, if: :address_changed?

  # Convert images string to array of images
  #
  def images_arr
    images.nil? ? [] : images.split(',')
  end

end
