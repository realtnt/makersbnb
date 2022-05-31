require "helpers/database_helpers"
require "space_entity"
require "spaces_table"
require 'date'

RSpec.describe SpacesTable do
  def clean_and_get_database
    DatabaseHelpers.clear_table("spaces")
    return DatabaseHelpers.test_db_connection
  end

  it "Starts with an empty table" do
    db = clean_and_get_database
    spaces_table = SpacesTable.new(db)
    expect(spaces_table.list).to eq([])
  end

  it "adds a user and lists them out" do
    db = clean_and_get_database
    spaces_table = SpacesTable.new(db)
    spaces_table.add(SpaceEntity.new("my_title",100,"my_description",Date.parse('2001-02-03'), Date.parse('2001-03-23'), 87))
    spaces = spaces_table.list
     
    expect(spaces.length).to eq 1
    expect(spaces[0].title).to eq "my_title"
    expect(spaces[0].price).to eq "100"
    expect(spaces[0].description).to eq "my_description"
    expect(spaces[0].date_from).to eq "2001-02-03"
    expect(spaces[0].date_to).to eq "2001-03-23"
    expect(spaces[0].host_id).to eq "87"
  end
end
