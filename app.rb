require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get("/") do
  erb(:index)
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/venues") do
  venue_name = params.fetch("venue_name")
  Venue.create({ :name => venue_name })
  redirect("/venues")
end

get("/bands") do
  @bands = Band.all()
  erb(:bands)
end

post("/bands") do
  band_name = params.fetch("band_name")
  Band.create({ :name => band_name })
  redirect("/bands")
end

get("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @venue_choices = Venue.all()
  @venues_played = @band.venues()
  erb(:band_detail)
end

delete("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @band.destroy()
  redirect("/bands")
end

patch("/bands/:id") do
  venue_ids = params["venue_ids"]
  new_band_name = params["band_name"]
  @band = Band.find(params.fetch("id").to_i())
  @band.update({ :venue_ids => venue_ids }) unless venue_ids.nil?
  @band.update({ :name => new_band_name }) unless new_band_name.nil?
  redirect("/bands/" + @band.id().to_s())
end
