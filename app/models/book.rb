class Book < ApplicationRecord


  validates :name, presence: true
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Book.where('name LIKE ?', "%#{search}%")
    else
      Book.all
    end
  end
end
