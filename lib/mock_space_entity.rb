class MockSpaceEntity
  attr_reader :title, :description, :price
  attr_reader :date_from, :date_to, :host_id, :id

  def initialize(
    title:, 
    description:, 
    price:, 
    date_from:, 
    date_to:, 
    host_id:, 
    id: nil
    )
    @title = title
    @description = description
    @price = price
    @date_from = date_from
    @date_to = date_to
    @host_id = host_id
    @id = id
  end
end
