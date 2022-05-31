class RequestEntity 
  def initialize(date, visitor_id = nil, space_id = nil, id = nil)
    @date = date
    @visitor_id = visitor_id
    @space_id = space_id
    @id = id
  end

  def date
    return @date
  end

  def visitor_id
    return @visitor_id
  end

  def space_id
    return @space_id
  end

  def id
    return @id
  end
end
