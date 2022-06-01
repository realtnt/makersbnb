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

  it "gets a single space" do
    db = clean_and_get_database
    requests_table = RequestsTable.new(db)
    request1 = requests_table.add(RequestEntity.new(Date.parse('2022-04-16'), 1, 2))
    request2 = requests_table.add(RequestEntity.new(Date.parse('3000-02-03'), 34, 99))
    request3 = requests_table.add(RequestEntity.new(Date.parse('4000-02-03'), 47, 67))
    request = requests_table.get(request1)
    expect(request.date).to eq "2022-04-16"
  end
end
