class UsersTable
    def initialize(db)
        @db = db
    end

    def list
        return @db.run("SELECT * FROM users ORDER BY id;").map do |row|
            row_to_object(row)
        end
    end

    def add(user)
        user = @db.run(
            "INSERT INTO users (name, email, password) 
            VALUES ($1, $2, $3) RETURNING id;", 
            [user.name, user.email, user.password]
            )
        return user[0]["id"]
    end

    private

    def row_to_object(row)
        return UserEntity.new(
            row["name"],
            row["email"],
            row["password"],
            row["id"]
        )
    end
end