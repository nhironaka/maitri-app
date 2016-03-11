
Given(/^the following users exist:$/) do |table|
  table.hashes.each do |user|
    User.create(:username => user[:username], :password => user[:password], :email => user[:email])
  end
end

@temp_user

When(/^I fill in user with "([^"]*)"$/) do |arg1|
  @temp_user = User.create(:username => arg1)
end

When(/^I fill in password with "([^"]*)"$/) do |arg1|
  @temp_user.update_attribute(:password => arg1)
end

Given(/^the following patients exist:$/) do |table|
  table.hashes.each do |patient|
    Patient.create(:name => patient["Name"], :gender => patient["Gender"], :start_date => patient["Start Date"])
  end
end

Then(/^I should (not\s+)?see "([^"]*)" before "([^"]*)"$/) do |no, arg1, arg2|
  if no 
    expect(page).not_to have_content(/#{arg1}.*#{arg2}.*/)
  else
    expect(page).to have_content(/#{arg1}.*#{arg2}.*/)
  end
end
