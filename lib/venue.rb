class Venue < ActiveRecord::Base
  has_many(:bands)
  validates(:name, :presence => true)
  validates(:city, :presence => true)
#   before_save(:capitalize_name)
#
# private
#
#   define_method(:capitalize_name) do
#     self.name=(name().capitalize())
#   end
end
