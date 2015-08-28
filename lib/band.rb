class Band < ActiveRecord::Base
  has_many(:venues)
end
