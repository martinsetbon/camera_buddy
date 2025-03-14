class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cameras
  has_many :reservations
  has_many :reservations_as_owner, through: :cameras, source: :reservations
  has_many :reviews, dependent: :destroy
end
