class Rate < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
end
