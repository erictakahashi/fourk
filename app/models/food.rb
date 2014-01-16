class Food < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :establishments
  has_and_belongs_to_many :categories

  def enrolled_in_category?(category)
    self.categories.include?(category)
  end

  def unenrolled_categories
    Category.all - self.categories
  end
end
