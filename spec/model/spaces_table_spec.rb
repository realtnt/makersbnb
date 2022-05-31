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

  it "gets a single space" do
    db = clean_and_get_database
    spaces_table = SpacesTable.new(db)
    space_1 = spaces_table.add(SpaceEntity.new("my_title", 200, "my_description",Date.parse('2022-02-03'),Date.parse('2023-03-04'), 65))
    space_2 = spaces_table.add(SpaceEntity.new("moon_base",1000,"lunar phase",Date.parse('2022-11-07'), Date.parse('2022-11-30'), 808))
    space_3 = spaces_table.add(SpaceEntity.new("my_title_2", 300, "my_description_2",Date.parse('4000-02-03'),Date.parse('4002-03-04'), 47))
    space = spaces_table.get(moon_base_id)
    expect(space.title).to eq "moon_base"
  end
end
