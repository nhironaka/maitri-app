
Given(/^the following users exist:$/) do |table|
  table.hashes.each do |user|
    User.create(:username => user["username"], :password => user["password"], :email => user["email"], :password_confirmation =>user["password_confirmation"])
  end
end

Then(/^I should (not\s+)?see "([^"]*)" before "([^"]*)"$/) do |no, arg1, arg2|
  if no 
    expect(page).not_to have_content(/#{arg1}.*#{arg2}.*/)
  else
    expect(page).to have_content(/#{arg1}.*#{arg2}.*/)
  end
    User.create(:username => user[:username], :password => user[:password], :email => user[:email], :password_confirmation => user[:password_confirmation])
end

