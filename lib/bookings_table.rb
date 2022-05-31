class BookingsTable
  def initialize(db)
    @db = db
  end

  def list
    return @db.run("SELECT * FROM bookings ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(booking)
    booking = @db.run(
        "INSERT INTO bookings (date, visitor_id, request_id, space_id) 
        VALUES ($1, $2, $3, $4) RETURNING id;", 
        [booking.date, booking.visitor_id, booking.request_id, booking.space_id]
        )
    return booking[0]["id"]
  end

  def get(index)
    result = @db.run("SELECT * FROM bookings WHERE id = $1;", [index])
    return row_to_object(result[0])
  end

  private

  def row_to_object(row)
    return BookingEntity.new(
      row["date"],
      row["visitor_id"],
      row["request_id"],
      row["space_id"],
      row["id"]
    )
  end
end
