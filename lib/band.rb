class Band < ActiveRecord::Base
  has_many(:venues)
  validates(:name, :presence => true)
  before_save(:capitalize_name)

private

  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end
end
