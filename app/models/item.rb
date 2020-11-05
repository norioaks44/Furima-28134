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
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum:1000 }
    validates :category_id, numericality: { other_than: 1,message:'Select' }
    validates :condition_id, numericality: { other_than: 1,message:'Select' }
    validates :delivery_charge_id, numericality: { other_than: 1,message:'Select' }
    validates :delivery_prefecture_id, numericality: { other_than: 1,message:'Select' }
    validates :delivery_day_id, numericality: { other_than: 1,message:'Select' }
    validates :price, numericality: { only_integer: true, greater_than: 300 , less_than: 9999999, message:'is out of setting range'}
  end
  
end
