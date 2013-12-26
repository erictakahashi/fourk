class Establishment < ActiveRecord::Base
  validates :name, :address, :city, presence: true
end
