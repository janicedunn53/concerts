class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  validates(:city, :presence => true)
  before_save(:titleize_name)
  before_save(:titleize_city)

private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end

  define_method(:titleize_city) do
    self.city=(city().titleize())
  end
end
