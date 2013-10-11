require 'spec_helper'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Pages' do
  it "should load the home page" do
    get '/'
    expect(last_response).should be_ok
  end
  # context "post title" do
  #   it "should show error message on page if too short" do
  #     expect(page).to include
  # end
end

describe Post do
  context "checking validations" do
    it { should have_many(:comments) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should_not allow_value("*"*4).for(:title) }
  end
end

describe Comment do
  context "checking validations" do
    it { should belong_to(:post) }
    it { should validate_presence_of(:content) }
    it { should_not allow_value("*"*1).for(:content) }
  end
end

# CAPYBARA

feature 'Index page errors' do
  scenario "user inputs too short title" do
    visit '/'
    fill_in "title", with: "hi"
    fill_in "content", with: "what"

    click_on "submit"

    expect(page).to have_content("Needs more than 4 characters".downcase)
  end

  scenario "user inputs too short content" do
    visit '/'
    fill_in "title", with: "An aweseome joke"
    fill_in "content", with: "a"
    click_on "submit"

    expect(page).to have_content("Needs more than 1 character".downcase)
  end

  scenario "user inputs blank for title" do
    visit '/'
    fill_in "title", with: ""
    fill_in "content", with: "aeiou and sometimes y"
    click_on "submit"

    expect(page).to have_content("Title can't be blank".downcase)
  end

  scenario "user inputs blank for content" do
    visit '/'
    fill_in "content", with: ""
    fill_in "title", with: "An interesting title"
    click_on "submit"

    expect(page).to have_content("Content can't be blank".downcase)
  end

  scenario "user inputs blank for content" do
    visit '/'
    fill_in "content", with: ""
    fill_in "title", with: "An interesting title"
    click_on "submit"

    expect(page).to have_content("Content can't be blank".downcase)
  end
end

feature 'Details page errors' do

  xscenario "user inputs blank comment" do
    visit '/detail/1/'
    fill_in "content", with: ""
    click_on "submit"

    expect(page).to have_content("Content can't be blank".downcase)
  end

end

# feature 'Guest creates title' do
#   scenario "it creates post title" do
#     visit '/'
#     fill_in "title", with: "(rspec) World's funniest joke"
#     fill_in "content", with: "(rspec) How do you put a baby into a jar?"

#     click_on "Submit"

#     expect(page).to have_content("(rspec) World's funniest joke")
#     expect(page).to have_content("(rspec) How do you put a baby into a jar?")
#   end
# end

