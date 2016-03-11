
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
