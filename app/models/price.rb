class Price < ActiveRecord::Base
  validates :value, presence: true

  belongs_to :food
end
