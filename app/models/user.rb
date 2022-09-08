class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role == 'admin'
  end
end
