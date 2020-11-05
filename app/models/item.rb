class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_prefecture
  belongs_to :delivery_day


  with_options presence: true  do
    validates :image
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :delivery_prefecture_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price
  end
end
