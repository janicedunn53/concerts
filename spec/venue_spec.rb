require('spec_helper')

describe(Venue) do
  describe('#bands') do
    it("returns the bands that play at the venue") do
      band1 = Band.create({:name => "Oingo Boingo"})
      band2 = Band.create({:name => "Red Hot Chili Peppers"})
      venue = Venue.new({:name => "Irvine Meadows Amphitheatre", :band_ids => [band1.id(), band2.id()]})
      expect(venue.bands()).to(eq([band1, band2]))
    end
  end

  it("validates presence of name") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end

  it("validates presence of city") do
    venue = Venue.new({:city => ""})
    expect(venue.save()).to(eq(false))
  end

  it("capitalizes the name of the venue") do
    venue = Venue.create({:name => "wiltern", :city => "Los Angeles"})
    expect(venue.name()).to(eq("Wiltern"))
  end
end
