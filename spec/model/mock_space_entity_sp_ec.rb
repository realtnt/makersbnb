require 'mock_space_entity'

RSpec.describe MockSpaceEntity do
  it "constructs without an ID" do
    mock_space = MockSpace.new(title: "title",
      description: "description",
      price: "price",
      date_from: "date from",
      date_to: "date to",
      host_id: "1"
    )
    expect(mock_space.title).to eq "title"
    expect(mock_space.description).to eq "description"
    expect(mock_space.price).to eq "price"
    expect(mock_space.date_from).to eq "date from"
    expect(mock_space.date_to).to eq "date to"
    expect(mock_space.host_id).to eq "1"
  end

  xit "constructs with an ID" do
    animal = AnimalEntity.new("Cat", 5)
    expect(animal.species).to eq "Cat"
    expect(animal.id).to eq 5
  end
end
