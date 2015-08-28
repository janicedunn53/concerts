class Venue < ActiveRecord::Base
  has_many(:bands)
  validates(:name, :presence => true)
  validates(:city, :presence => true)
end
