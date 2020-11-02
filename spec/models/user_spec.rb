require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      # expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      # expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    
    it "emailに@が含まれていなければ登録できない" do
      @user.email = "katoukatou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      # binding.pry
    end
    
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      # expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      # expect(@user.errors.full_messages).to include("パスワードを入力してください","パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      # expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
    end
    it  "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      # expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordが英字と数字の両方を含まれていない" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")     
      # expect(@user.errors.full_messages).to include("パスワードは半角英数字それぞれ１文字以上含む必要があります")     
    end
    it "苗字が無いと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank and enter in full characters")     
    end
    it "名前が無いと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank and enter in full characters")     
    end
    it "苗字は全角でなければ登録できない" do
      @user.last_name = "kato"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank and enter in full characters")     
    end
    it "名前は全角でなければ登録できない" do
      @user.first_name = "touka"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank and enter in full characters")     
    end
    it "苗字のフリガナが無いと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank and enter in katakana characters")
    end
    it "名前のフリガナが無いと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank and enter in katakana characters")
    end
    it "フリガナがカタカナでければ登録できない" do
      @user.first_name_kana = "touka"
      @user.last_name_kana = "かとう"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank and enter in katakana characters","First name kana can't be blank and enter in katakana characters")     
    end
    it "生年月日が空だと登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end