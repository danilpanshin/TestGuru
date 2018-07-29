class Badge < ApplicationRecord
  has_many :user_badges, dependent: :nullify
  has_many :users, through: :user_badges
end
