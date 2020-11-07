require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end

  describe '商品出品' do
    it '出品画像(image)、商品名(name)、商品の説明(text)、カテゴリー(category_id)、商品の状態(condition_id)、配送料の負担(delivery_charge_id)、発送元の地域(delivery_prefecture_id)、発送までの日数(delivery_day_id)、販売価格(price)が存在していれば保存できること' do
      expect(@item).to be_valid
    end
    it '販売価格が300円であれば保存できる' do
      @item.price = '300'
      expect(@item).to be_valid
    end
    it '販売価格が9,999,999円であれば保存できる' do
      @item.price = '9999999'
      expect(@item).to be_valid
    end

    it '出品画像が空欄では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空欄では保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品名が41文字以上では保存できないこと' do
      @item.name = 'あ' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
    end
    it '商品の説明が空欄では保存できないこと' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it '商品の説明が1001文字以上では保存できないこと' do
      @item.text = 'あ' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
    end
    it 'カテゴリーが空欄では保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it 'カテゴリーのidが1では保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態が空欄では保存できないこと' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end
    it '商品の状態のidが1では保存できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end
    it '配送料の負担が空欄では保存できないこと' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery charge Select')
    end
    it '配送料の負担のidが1では保存できないこと' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery charge Select')
    end
    it '発送元の地域が空欄では保存できないこと' do
      @item.delivery_prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery prefecture Select')
    end
    it '発送元の地域のidが1では保存できないこと' do
      @item.delivery_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery prefecture Select')
    end
    it '発送までの日数が空欄では保存できないこと' do
      @item.delivery_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day Select')
    end
    it '発送までの日数のidが1では保存できないこと' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day Select')
    end
    it '販売価格が空欄では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が300円未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range and enter half-width number')
    end
    it '販売価格が10,000,000円以上では保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range and enter half-width number')
    end
    it '販売価格が全角入力では保存できないこと' do
      @item.price = '１２３'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range and enter half-width number')
    end
  end
end
