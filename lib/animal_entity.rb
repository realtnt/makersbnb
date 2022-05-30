class AnimalEntity
  def initialize(species, id = nil)
    @species = species
    @id = id
  end

  def species
    return @species
  end

  def id
    return @id
  end
end
