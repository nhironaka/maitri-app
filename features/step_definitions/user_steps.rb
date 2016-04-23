Given(/^the following users exist:$/) do |table|
  table.hashes.each do |user|
    User.create(:username => user["username"], :password => user["password"], :email => user["email"], :password_confirmation =>user["password_confirmation"])
  end
end

Given /I am logged in/ do
  User.create(:username=>"existuser", :password=>"existuser1", :email=>"existuser1@gmail.com", :password_confirmation=>"existuser1")
  user = "existuser"
  password = "existuser1"
  visit '/users/sign_in'
  fill_in "user_login", :with => user
  fill_in "user_password", :with => password
  click_button "Log In"
end

Given /I am not logged in/ do
  user = "existuser"
  visit '/users/forgot_password'
  fill_in "user_email", :with =>user
  click_button "Send me reset password instructions"
end

Then(/^I should (not\s+)?see "([^"]*)" before "([^"]*)"$/) do |no, arg1, arg2|
  if no 
    expect(page).not_to have_content(/#{arg1}.*#{arg2}.*/)
  else
    expect(page).to have_content(/#{arg1}.*#{arg2}.*/)
  end
    User.create(:username => user[:username], :password => user[:password], :email => user[:email], :password_confirmation => user[:password_confirmation])
end


