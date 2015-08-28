require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('the path to all venues', {:type => :feature}) do
  it("allows the user to navigate to the venues page") do
    visit("/")
    click_link('Venues')
    expect(page).to have_content("Venues")
  end
end

describe('path to add venue', {:type => :feature}) do
  it("allows user to add a new venue") do
    visit("/venues")
    fill_in('name', :with => "Palladium")
    fill_in('city', :with => "Hollywood")
    click_button('Add Venue')
    expect(page).to have_content("Venues")
  end
end
