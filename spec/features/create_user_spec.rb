require 'rails_helper'

describe "Creating a new user" do
  it "saves the user" do
    u = User.new(user_attributes)
    u.save

    expect(User.first.name).to eq("Emmylou")
    expect(User.first.email).to eq("emmylou@firstaidkit.com")
    expect(User.first.password_digest.empty?).to be(false)
  end

end