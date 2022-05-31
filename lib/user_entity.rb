class UserEntity
  def initialize(name, email, password, id = nil)
    @name = name
    @email = email
    @password = password
    @id = id
  end

  def name
    return @name
  end

  def email
    return @email
  end

  def password
    return @password
  end

  def id
    return @id
  end
end
