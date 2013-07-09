# page objects
# http://opensourcetester.co.uk/2012/08/06/cucumber-page-object-global/

# tabular data
# http://coryschires.com/ten-tips-for-writing-better-cucumber-steps/

# and hey, I have a copy of Markus' book too, not to forget

include Capybara::DSL
include RSpec::Matchers

@default_date = '1/1/2014'
def fill_in_form(lot, start_time, end_time, start_date=@default_date , end_date=@default_date )
  select lot, from: 'ParkingLot'
  fill_in 'StartingDate', with: start_date
  fill_in 'LeavingDate', with: end_date
  fill_in 'StartingTime', with: start_time
  fill_in 'LeavingTime', with: end_time
end

Given(/^that I'm using the parking calculator$/) do
  visit 'http://www.shino.de/parkcalc/'
end

Given(/^that I park for one hour in economy parking$/) do
  fill_in_form 'Short-Term Parking', '10:00', '11:00'
end

Given(/^that I park for one hour in valet parking$/) do
  fill_in_form 'Valet Parking', '10:00', '11:00'
end

When(/^I take my car back$/) do
  click_button 'Calculate'
end

Then(/^I pay \$ (\d+)\.(\d+)$/) do |dollars, cents|
  expect(page).to have_selector '.SubHead', text: "$ #{dollars}.#{cents}"
end

