require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '配送先の保存' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_purchase.postal_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_purchase.postal_code = "1234567"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    
    it 'prefectureを選択していないと保存できないこと' do
      @user_purchase.delivery_prefecture_id = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Delivery prefecture can't be blank")
    end
    it 'cityは空では保存できないこと' do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'cityは全角入力以外では保存できないこと' do
      @user_purchase.city = 'aiueokakiku'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City is invalid. Input full-width characters.")
    end
    it 'house_numberは空では保存できないこと' do
      @user_purchase.house_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @user_purchase.building_name = nil
      expect(@user_purchase).to be_valid
    end
    
    it 'phoen_numbeerが空だと保存できないこと' do
      @user_purchase.phone_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字以外では保存できないこと' do
      @user_purchase.phone_number = '１２３４５６７８９０'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    
    it 'tokenが空では保存できないこと' do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      # binding.pry
    end

  end
end