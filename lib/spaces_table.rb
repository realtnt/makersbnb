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
        "INSERT INTO spaces (title, price, description, date_from, date_to, img_url, host_id) 
        VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;", 
        [space.title, space.price, space.description, space.date_from, space.date_to, space.img_url, space.host_id]
        )
    return space[0]["id"]
  end  

  def get(index)
    result = @db.run("SELECT * FROM spaces WHERE id = $1;", [index])
    return row_to_object(result[0])
  end

  private

  def row_to_object(row)
    return SpaceEntity.new(
      row["title"],
      row["price"],
      row["description"],
      row["date_from"],
      row["date_to"],
      row["img_url"],
      row["host_id"],
      row["id"]
    )
  end
end
