class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_perfecture
  belongs_to :delivery_day
  
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }

  # validates :image, presence: true, unless: :was_attached?

  # def was_attached?
  #   self.image.attached?
  # end
end
