class Establishment < ActiveRecord::Base
  validates :name, :address, :city, presence: true

  has_and_belongs_to_many :foods
  has_and_belongs_to_many :categories

  # Check if a establishment is enrolled with a food
  def enrolled_in?(food)
    self.foods.include?(food)
  end

  # Return foods that is not enrolled with the establishment
  def unenrolled_foods
    Food.all - self.foods
  end

  def enrolled_in_category?(category)
    self.categories.include?(category)
  end

  def unenrolled_categories
    Category.all - self.categories
  end
end
