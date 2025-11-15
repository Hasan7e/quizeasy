class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :attempts, dependent: :destroy
end
