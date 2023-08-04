class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :post_image

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
