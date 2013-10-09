require 'spec_helper'

# describe 'Page exists' do
#   include Rack::Test::Methods

#   def app
#     Sinatra::Application
#   end

#   it "should load the home page" do
#     get '/'
#     expect(last_response).should be_ok
#   end
# end

feature 'page exists' do
  scenario "it loads home page" do
    visit '/'
    expect(page).to have_content("hi")
  end
end

feature 'Guest creates title' do
  scenario "it creates post title" do
    visit '/'
    fill_in "title", with: "(rspec) World's funniest joke"
    fill_in "content", with: "(rspec) How do you put a baby into a jar?"

    click_on "Submit"

    expect(page).to have_content("(rspec) World's funniest joke")
    expect(page).to have_content("(rspec) How do you put a baby into a jar?")
  end
end


#   # This is a STRETCH scenario. MOVE ON unless you've already pushed to heroku
#   # and submitted a pull request
#   xscenario "it does not create the todo if they don't provide a name" do
#     visit '/'

#     click_on "Create Todo"

#     expect(page).to have_content("You must provide a name for your todo!")
#   end
# end