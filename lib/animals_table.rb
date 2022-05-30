require "animal_entity"

class AnimalsTable
  def initialize(db)
    @db = db
  end

  def list
    return @db.run("SELECT * FROM animals ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(animal)
    result = @db.run("INSERT INTO animals (species) VALUES ($1) RETURNING id;", [animal.species])
    return result[0]["id"]
  end

  def remove(index)
    @db.run("DELETE FROM animals WHERE id = $1;", [index])
  end

  def update(index, species)
    @db.run("UPDATE animals SET species = $1 WHERE id = $2;", [species, index])
  end

  def get(index)
    result = @db.run("SELECT * FROM animals WHERE id = $1;", [index])
    return row_to_object(result[0])
  end

  private

  def row_to_object(row)
    return AnimalEntity.new(
      row["species"],
      row["id"]
    )
  end
end
