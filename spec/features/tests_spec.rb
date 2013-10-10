require 'spec_helper'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Page exists' do
  it "should load the home page" do
    get '/'
    expect(last_response).should be_ok
  end
end

describe Post do
  it { should have_many(:comments) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should_not allow_value("*"*4).for(:title) } 
end

describe Comment do
  it { should belong_to(:post) }
  it { should validate_presence_of(:content) }
  it { should_not allow_value("*"*1).for(:content) } 
end



# feature 'page exists' do
#   scenario "it loads home page" do
#     visit '/'
#     expect(page).to have_content("hi")
#   end
# end

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

