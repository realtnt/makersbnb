require 'helpers/database_helpers'
require 'user_entity'
require 'users_table'

RSpec.describe UsersTable do
  def clean_and_get_database
    DatabaseHelpers.clear_table("users")
    return DatabaseHelpers.test_db_connection
  end

  it "starts with an empty table" do
    db = clean_and_get_database
    users_table = UsersTable.new(db)
    expect(users_table.list).to eq ([])
  end

  it "adds a user and lists them out" do
    db = clean_and_get_database
    users_table = UsersTable.new(db)
    users_table.add(UserEntity.new("Bob","bob@bob.com","bobpass1234"))
    users = users_table.list
    expect(users.length).to eq 1
    expect(users[0].name).to eq "Bob"
    expect(users[0].email).to eq "bob@bob.com"
    expect(users[0].password).to eq "bobpass1234"
  end

  it "gets a single user" do
    db = clean_and_get_database
    users_table = UsersTable.new(db)
    user1 = users_table.add(UserEntity.new("my_name1", "my_email1", "my_password1"))
    user2 = users_table.add(UserEntity.new("my_name2", "my_email2", "my_password2"))
    user1 = users_table.add(UserEntity.new("my_name3", "my_email3", "my_password3"))
    user = users_table.get(user2)
    expect(user.name).to eq "my_name2"
  end
end
