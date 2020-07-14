class Book < ApplicationRecord


  validates :name, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Book.where('name LIKE ?', "%#{search}%")
    else
      Book.all
    end
  end
end
