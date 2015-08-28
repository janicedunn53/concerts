class Band < ActiveRecord::Base
  has_many(:venues)
  validates(:name, :presence => true)
end
