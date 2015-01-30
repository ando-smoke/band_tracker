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
