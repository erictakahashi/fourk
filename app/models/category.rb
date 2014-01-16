class Category < ActiveRecord::Base
  has_and_belongs_to_many :establishments
  has_and_belongs_to_many :foods
end
