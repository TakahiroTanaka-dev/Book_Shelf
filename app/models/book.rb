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

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end


  mount_uploader :image, ImageUploader

end
