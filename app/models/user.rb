class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers
  has_many :receiver_answers, foreign_key: "receiver_id"

  validates :name, presence: true
  validates :ranking, presence: true
  validates :gender, presence: true
  validates :age, presence: true

  scope :all_except, ->(user) { where.not(id: user) }
end

