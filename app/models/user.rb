class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  # EMAIL_REGEX = /[\w\-._]+@[\w\-._]+\.[A-Za-z]+/.freeze
  # validates :email, format: { with: EMAIL_REGEX, message: "doesn't exist @"}
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :first_name, presence: true, format: { with: NAME_REGEX, message: "can't be blank and enter in full characters"}
  validates :last_name, presence: true, format: { with: NAME_REGEX, message: "can't be blank and enter in full characters"}
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, format: { with: KANA_REGEX, message: "can't be blank and enter in katakana characters" }
  validates :last_name_kana, format: { with: KANA_REGEX, message: "can't be blank and enter in katakana characters" }
  # 全角カタカナ
  validates :birth_date, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: "include both letters and numbers"}
  
  
  # validates_format_of :password, with: PASSWORD_REGEX
  # format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
end
