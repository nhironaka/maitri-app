
Given(/^the following users exist:$/) do |table|
  table.hashes.each do |user|
    User.create(:username => user["username"], :password => user["password"], :email => user["email"], :password_confirmation =>user["password_confirmation"])
  end
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
