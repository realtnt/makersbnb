require 'animal_entity'

RSpec.describe AnimalEntity do
  it "constructs without an ID" do
    animal = AnimalEntity.new("Cat")
    expect(animal.species).to eq "Cat"
  end

  it "constructs with an ID" do
    animal = AnimalEntity.new("Cat", 5)
    expect(animal.species).to eq "Cat"
    expect(animal.id).to eq 5
  end
end
