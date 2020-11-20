class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,    presence: true
  validates :family_name, presence: true
  validates :first_name,  presence: true
  validates :family_kana, presence: true
  validates :first_kana,  presence: true
  validates :birth_date,  presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定して下さい'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力して下さい' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カナで入力して下さい' } do
    validates :family_kana
    validates :first_kana
  end
end
