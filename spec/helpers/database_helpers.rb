require "database_connection"

class DatabaseHelpers
  def self.clear_table(table_name)
    test_db_connection.run("DELETE FROM #{table_name};")
  end

  def self.test_db_connection
    $test_connection ||= DatabaseConnection.new("localhost", "web_application_test")
  end
end
