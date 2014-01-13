class Establishment < ActiveRecord::Base
  validates :name, :address, :city, presence: true

  has_and_belongs_to_many :foods

  # Check if a establishment is enrolled with a food
  def enrolled_in?(food)
    self.foods.include?(food)
  end

  # Return foods that is not enrolled with the establishment
  def unenrolled_foods
    Food.all - self.foods
  end
end
