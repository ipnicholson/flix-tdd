require 'rails_helper'

describe "A User" do
  it "requires a name" do
    u = User.new

    u.name = ""

    u.save

    expect(u.errors[:name].any?).to be(true)
  end

  it "requires a valid name" do
    u = User.new

    u.name = "Emmylou"

    u.save

    expect(u.errors[:name].any?).to be(false)
  end

  it "requires an email" do
    u = User.new

    u.email = ""

    u.save

    expect(u.errors[:email].any?).to be(true)
  end

  it "accepts properly formatted email addresses" do
    emails = %w[emmylou@firstaidkit.com my.user@example.co]

    emails.each do |email|
      u = User.new
      u.email = email
      u.save

      expect(u.errors[:email].any?).to be(false)
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = %w[emmy@ @firstaidkit.com @]

    emails.each do |email|
      u = User.new(email: email)
      u.save

      expect(u.errors[:email].any?).to be(true)
    end
  end

end