require('spec_helper')

describe(Band) do
  describe('#venues') do
    it("returns the venues a band plays at") do
      venue1 = Venue.create({:name => "Greek Theatre", :city => "Los Angeles"})
      venue2 = Venue.create({:name => "The Wiltern", :city => "Los Angeles"})
      band = Band.new({:name => "Muse", :venue_ids => [venue1.id(), venue2.id()]})
      expect(band.venues()).to(eq([venue1, venue2]))
    end
  end

  it("validates presence of name") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end
end
