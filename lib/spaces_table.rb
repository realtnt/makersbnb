class SpacesTable 
  def initialize(db)
    @db = db
  end

  def list
    return @db.run("SELECT * FROM spaces ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(space)
    space = @db.run(
        "INSERT INTO spaces (title, price, description, date_from, date_to, host_id) 
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;", 
        [space.title, space.price, space.description, space.date_from, space.date_to, space.host_id]
        )
    return space[0]["id"]
  end

  private

  def row_to_object(row)
    return SpaceEntity.new(
      row["title"],
      row["price"],
      row["description"],
      row["date_from"],
      row["date_to"],
      row["host_id"],
      row["id"]
    )
  end
end
