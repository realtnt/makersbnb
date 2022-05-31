class RequestsTable
  def initialize(db)
    @db = db
  end

  def list
    return @db.run("SELECT * FROM requests ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(request)
    request = @db.run(
        "INSERT INTO requests (date, visitor_id, space_id) 
        VALUES ($1, $2, $3) RETURNING id;", 
        [request.date, request.visitor_id, request.space_id]
        )
    return request[0]["id"]
  end

  private

  def row_to_object(row)
    return RequestEntity.new(
      row["date"],
      row["visitor_id"],
      row["space_id"],
      row["id"]
    )
  end
end
