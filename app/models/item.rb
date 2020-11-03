class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?
  
  def was_attached?
    self.image.attached
  end
end
