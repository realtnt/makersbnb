require "helpers/database_helpers"
require "animal_entity"
require "animals_table"

RSpec.describe AnimalsTable do
  def clean_and_get_database
    DatabaseHelpers.clear_table("animals")
    return DatabaseHelpers.test_db_connection
  end

  it "start with an empty table" do
    db = clean_and_get_database
    animals_table = AnimalsTable.new(db)
    expect(animals_table.list).to eq([])
  end

  it "adds animals and lists them out again" do
    db = clean_and_get_database
    animals_table = AnimalsTable.new(db)
    animals_table.add(AnimalEntity.new("Cat"))

    # Note — you need to look at each individual field to check, you can't just
    # compare with the animal you put in because the animal that came out will
    # be a different Ruby object.
    animals = animals_table.list
    expect(animals.length).to eq 1
    expect(animals[0].species).to eq "Cat"
  end

  it "removes animals" do
    db = clean_and_get_database
    animals_table = AnimalsTable.new(db)

    # Note — just assuming the indexes are 1, 2, 3 doesn't work anymore
    # We need to let the database tell us what it has set the ID to.
    cat_id = animals_table.add(AnimalEntity.new("Cat"))
    dog_id = animals_table.add(AnimalEntity.new("Dog"))
    frog_id = animals_table.add(AnimalEntity.new("Frog"))

    animals_table.remove(dog_id)

    animals = animals_table.list
    expect(animals.length).to eq 2
    expect(animals[0].species).to eq "Cat"
    expect(animals[1].species).to eq "Frog"
  end

  it "updates animals" do
    db = clean_and_get_database
    animals_table = AnimalsTable.new(db)

    cat_id = animals_table.add(AnimalEntity.new("Cat"))
    dog_id = animals_table.add(AnimalEntity.new("Dog"))
    frog_id = animals_table.add(AnimalEntity.new("Frog"))

    animals_table.update(dog_id, "Zebra")

    animals = animals_table.list
    expect(animals.length).to eq 3
    expect(animals[0].species).to eq "Cat"
    expect(animals[1].species).to eq "Zebra"
    expect(animals[2].species).to eq "Frog"
  end

  it "gets a single animal" do
    db = clean_and_get_database
    animals_table = AnimalsTable.new(db)

    cat_id = animals_table.add(AnimalEntity.new("Cat"))
    dog_id = animals_table.add(AnimalEntity.new("Dog"))
    frog_id = animals_table.add(AnimalEntity.new("Frog"))

    animal = animals_table.get(dog_id)
    expect(animal.species).to eq "Dog"
  end
end
