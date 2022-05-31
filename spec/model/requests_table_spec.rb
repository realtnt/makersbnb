require 'helpers/database_helpers'
require 'request_entity'
require 'requests_table'

RSpec.describe RequestsTable do
  def clean_and_get_database
    DatabaseHelpers.clear_table("requests")
    return DatabaseHelpers.test_db_connection
  end

  it "Starts with an empty table" do
    db = clean_and_get_database
    requests_table = RequestsTable.new(db)
    expect(requests_table.list).to eq([])
  end

  it "adds a requests and lists them out" do
    db = clean_and_get_database
    request = RequestsTable.new(db)
    request.add(RequestEntity.new(Date.parse('2001-02-03'), 15, 23))
    requests = request.list
    expect(requests.length).to eq 1
    expect(requests[0].date).to eq "2001-02-03"
    expect(requests[0].visitor_id).to eq "15"
    expect(requests[0].space_id).to eq "23"       
  end
end
