class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
        #  has_many :buys

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }

         validates :nickname, presence: true
         validates :family_name, format: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
         validates :first_name, format: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
         validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birthday, presence: true
end
