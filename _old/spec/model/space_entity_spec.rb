require 'space_entity'

RSpec.describe SpaceEntity do
  it "constructs correctly (again)" do
    space = SpaceEntity.new("Ski chalet", 250, "A nice big ski chalet with fire", "2022-06-01", "2022-12-31", "https://lookatmyspace.com", 1)
    expect(space.title).to eq "Ski chalet"
    expect(space.price).to eq 250
    expect(space.description).to eq "A nice big ski chalet with fire"
    expect(space.date_from).to eq "2022-06-01"
    expect(space.date_to).to eq "2022-12-31"
    expect(space.img_url).to eq "https://lookatmyspace.com"
    expect(space.host_id).to eq 1
  end
end
