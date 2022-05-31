require 'request_entity'

RSpec.describe RequestEntity do
  it "Constructs request entity" do
    request = RequestEntity.new(
        2022 - 0o5 - 12, # date requested
        1, # visitor_id
        2 # space_id   
    )

    expect(request.visitor_id).to eq 1
    expect(request.space_id).to eq 2
    expect(request.date).to eq 2022 - 0o5 - 12
  end
end
