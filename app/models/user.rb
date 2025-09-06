class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_MIXED = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/
         NAME_ZENKAKU = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
         KATAKANA_ONLY = /\A[ァ-ヶー]+\z/
  validates :password,format: {with: PASSWORD_MIXED}
  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with: NAME_ZENKAKU}
  validates :last_name, presence: true,  format: {with: NAME_ZENKAKU}
  validates :first_name_kana, presence: true, format: {with: KATAKANA_ONLY}
  validates :last_name_kana, presence: true,  format: {with: KATAKANA_ONLY}
  validates :birth_date, presence: true

  has_many :items
end
