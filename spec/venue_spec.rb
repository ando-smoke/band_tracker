require("spec_helper")

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }

  it { should validate_presence_of(:name) }

  it("capitalizes the venue name") do
    test_venue = Venue.create({ :name => "stubb's bar" })
    expect(test_venue.name()).to(eq("Stubb's Bar"))
  end
end
