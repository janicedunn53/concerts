require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/bands") do
  @bands = Band.all()
  erb(:bands)
end

post("/bands") do
  name = params.fetch('name')
  Band.create({:name => name})
  redirect("/bands")
end

get("/bands/:id") do
  band_id = params.fetch('id').to_i()
  @band = Band.find(band_id)
  @venues = Venue.all()
  erb(:band)
end

post("/band/venue") do
  id = params.fetch('venue_select').to_i()
  new_venue = Venue.find(id)
  band_id = params.fetch('band_id').to_i()
  @band = Band.find(band_id)
  @band.venues.push(new_venue)
  redirect("/bands/#{band_id.to_s}")
end

delete("/band/delete") do
  band = Band.find(params.fetch('band_id').to_i())
  band.destroy()
  redirect('/bands')
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/venues") do
  name = params.fetch('name')
  city = params.fetch('city')
  Venue.create({:name => name, :city => city})
  redirect("/venues")
end
