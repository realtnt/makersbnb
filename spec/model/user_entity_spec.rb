require 'user_entity'

RSpec.describe UserEntity do
  it "constructs correctly (as always)" do
    user = UserEntity.new("Tom", "tom@email.com","tompass1234")
    expect(user.name).to eq "Tom"
    expect(user.email).to eq "tom@email.com"
    expect(user.password).to eq "tompass1234"
  end
end
