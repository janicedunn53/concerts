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

describe('path to a band', {:type => :feature}) do
  it("allows user to navigate to the page of an individual band") do
    visit("/bands")
    fill_in('name', :with => "Darkness")
    click_button('Add Band')
    click_link('Darkness')
    expect(page).to have_content("Darkness")
  end
end

# describe('path to view venues of band') do
#   it("allows user to add a venue to the concert list of the band") do
#     visit("/bands/1")
#     check('Wiltern')
#     click_button('Add Venue')
#     expect(page).to have_content("Darkness")
#   end
# end
