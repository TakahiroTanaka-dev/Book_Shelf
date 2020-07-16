class Book < ApplicationRecord


  validates :name, presence: true
  
  def self.search(search)
    if search
      Book.where('name LIKE ?', "%#{search}%")
    else
      Book.all
    end
  end

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end


  mount_uploader :image, ImageUploader

end
