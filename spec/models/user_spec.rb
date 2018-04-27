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

  it "requires a password" do
    u = User.new(password: "")

    u.valid?

    expect(u.errors[:password].any?).to be(true)
  end

  it "requires a password confirmation when a password is present" do
    u = User.new(password: "test1234", password_confirmation: "")

    u.valid?

    expect(u.errors[:password_confirmation].any?).to be(true)

  end

  it "requires the password to match the password confirmation" do
    u = User.new(password: "test1234", password_confirmation: "notmatch")

    u.valid?

    expect(u.errors[:password_confirmation].first).to eq("doesn't match Password")
  end

  it "requires a password and matching password confirmation when creating" do
    u = User.new(user_attributes(password: "test1234", password_confirmation: "test1234"))

    expect(u.valid?).to be(true)
  end

  it "does not require a password when updating" do
    u = User.create(user_attributes)

    u.password = ""

    expect(u.valid?).to be(true)
  end

  it "automatically encrypts the password into the password_digest attribute" do
    u = User.create(user_attributes)

    expect(u[:password_digest].present?).to be(true)
    expect(u[:password_digest]).to_not eq(user_attributes[:password])
  end

  it "is valid with example attributes" do
    u = User.new(user_attributes)

    expect(u.valid?).to be(true)
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

  it "requires a unique, case-insensitive email address" do
    u_1 = User.new(user_attributes)
    u_1.save

    email_upcase = user_attributes[:email].upcase
    u_2 = User.new(user_attributes(email: email_upcase))
    u_2.save

    expect(u_2.errors[:email].first).to eq("has already been taken")
  end

end