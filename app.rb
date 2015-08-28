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

# post("/bands") do
#   name = params.fetch('name')
#   @band = Band.new({:name => name})
#   if @band.save()
#     redirect("/bands")
#   else
#     erb(:errors)
#   end
# end

get("/bands/:id") do
  band_id = params.fetch('id').to_i()
  @band = Band.find(band_id)
  @venues = Venue.all()
  erb(:band)
end

patch("/bands/:id") do
  band_id = params.fetch('id').to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch('venue_ids')
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  erb(:band)
end

delete("/band/delete") do
  band = Band.find(params.fetch('band_id').to_i())
  band.destroy()
  redirect("/bands")
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
