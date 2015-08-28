require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('the path to all bands', {:type => :feature}) do
  it("allows the user to navigate to the bands page") do
    visit("/")
    click_link('Bands')
    expect(page).to have_content("Bands")
  end
end

describe('path to add band', {:type => :feature}) do
  it("allows user to add a new band") do
    visit("/bands")
    fill_in('name', :with => "Darkness")
    click_button('Add Band')
    expect(page).to have_content("Bands")
  end
end
