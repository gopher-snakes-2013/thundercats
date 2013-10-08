require 'spec_helper'

describe 'Page exists' do
  it 'should load the home page' do
    get '/'
    last.response.should be_ok
  end
end

feature 'Guest creates title' do
  xscenario "it creates post title" do
    visit '/'
    fill_in "Title", with: "Take out the trash"

    click_on "Create Todo"

    expect(page).to have_content("Take out the trash")
  end

  # This is a STRETCH scenario. MOVE ON unless you've already pushed to heroku
  # and submitted a pull request
  xscenario "it does not create the todo if they don't provide a name" do
    visit '/'

    click_on "Create Todo"

    expect(page).to have_content("You must provide a name for your todo!")
  end
end