require 'booking_entity'

RSpec.describe BookingEntity do
  it "Constructs Booking entity" do
    booking = BookingEntity.new(
        2022 - 0o4 - 30, # date
        1, # visitor id
        2, # request_id
        3, # space_id
    )
    expect(booking.date).to eq 2022 - 0o4 - 30
    expect(booking.visitor_id).to eq 1
    expect(booking.request_id).to eq 2
    expect(booking.space_id).to eq 3
  end
end
