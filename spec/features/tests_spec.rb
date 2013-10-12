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

    expect(page).to have_content("needs more than 4 characters")
  end

  scenario "user inputs too short content" do
    visit '/'
    fill_in "title", with: "An aweseome joke"
    fill_in "content", with: "a"
    click_on "submit"

    expect(page).to have_content("needs more than 1 character")
  end

  scenario "user inputs blank for title" do
    visit '/'
    fill_in "title", with: ""
    fill_in "content", with: "aeiou and sometimes y"
    click_on "submit"

    expect(page).to have_content("title can't be blank")
  end

  scenario "user inputs blank for content" do
    visit '/'
    fill_in "content", with: ""
    fill_in "title", with: "An interesting title"
    click_on "submit"

    expect(page).to have_content("content can't be blank")
  end

  scenario "user inputs blank for content" do
    visit '/'
    fill_in "content", with: ""
    fill_in "title", with: "An interesting title"
    click_on "submit"

    expect(page).to have_content("content can't be blank")
  end
end

feature 'Details page errors' do

  scenario "user inputs blank comment" do
    post = Post.create(title: "title", content: "content")
    visit "/detail/#{post.id}"
    fill_in "content", with: ""
    click_on "submit"

    expect(page).to have_content("content can't be blank")
  end

end
