class SpacesTable 
    def initialize(db)
        @db = db
    end

    def list
        return @db.run("SELECT * FROM spaces ORDER BY id;").map do |row|
            row_to_object(row)
        end
    end

    private

    def row_to_object(row)
        return SpaceEntity.new(
            row["title"],
            row["price"],
            row["description"],
            row["date_from"],
            row["date_to"],
            row["host_id"],
            row["id"]
        )
    end
end