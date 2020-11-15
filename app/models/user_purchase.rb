class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Input half-width characters."}
  end
  validates :delivery_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

def save
  purchase = Purchase.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, delivery_prefecture_id: delivery_prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
end

end