class Price < ActiveRecord::Base
  validates :value, presence: true

  belongs_to :food
  has_many :rates, as: :rateable
end
