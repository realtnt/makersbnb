class SpaceEntity
  def initialize(
      title, price, description, 
      date_from, date_to, host_id = nil, id = nil
      )

    @title = title
    @price = price
    @description = description
    @date_from = date_from
    @date_to = date_to
    @host_id = host_id
    @id = id
  end

  def title
    return @title
  end

  def price
    return @price
  end
    
  def description
    return @description
  end

  def date_from
    return @date_from
  end

  def date_to 
    return @date_to
  end

  def host_id
    return @host_id
  end

  def id
    return @id
  end
end
