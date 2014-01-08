class Establishment < ActiveRecord::Base
  validates :name, :address, :city, presence: true

  has_and_belongs_to_many :foods
end
