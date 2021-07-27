class Customer < ApplicationRecord
  
  belongs_to :member
  
  geocoded_by :address
  after_validation :geocode
  
  validates :company, presence: true
  validates :name, presence: true
  validates :address, presence: true

  has_many :post_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy

end
