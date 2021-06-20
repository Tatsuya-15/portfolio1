class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
   has_many :customers, dependent: :destroy
   attachment :member_image
   has_one :customer, dependent: :destroy
   accepts_nested_attributes_for :customer
   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   
  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
  
end
