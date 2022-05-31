require 'helpers/database_helpers'
require 'booking_entity'
require 'bookings_table'

RSpec.describe BookingsTable do
  def clean_and_get_database
    DatabaseHelpers.clear_table("bookings")
    return DatabaseHelpers.test_db_connection
  end

  it "Starts with an empty table" do
    db = clean_and_get_database
    bookings_table = BookingsTable.new(db)
    expect(bookings_table.list).to eq([])
  end

  it "adds a bookings and lists them out" do
    db = clean_and_get_database
    booking = BookingsTable.new(db)
    booking.add(BookingEntity.new(Date.parse('2001-02-03'), 15, 45, 23))
    bookings = booking.list
    expect(bookings.length).to eq 1
    expect(bookings[0].date).to eq "2001-02-03"
    expect(bookings[0].visitor_id).to eq "15"
    expect(bookings[0].request_id).to eq "45"
    expect(bookings[0].space_id).to eq "23"
         
  end
end