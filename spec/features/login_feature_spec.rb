require 'spec_helper'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe User do
  context "checking user validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should_not allow_value("*"*6).for(:password) }
    it { should_not allow_value("*"*2).for(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  context "checking user associations" do
    it { should have_many(:posts) }
  end
end

feature "user sign up" do
  scenario "a user signs up for jokez" do
    visit '/signup'
    fill_in "username", with: "CartsMgarts"
    fill_in "password", with: "password"

    click_on "Sign Up"

    expect(page).to have_content("Welcome to jokez landz CartsMgarts")
  end
end

# feature "Login form" do
#   secnario "us"
# end