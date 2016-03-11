# Add a declarative step here for populating the DB with patients.

Given /the following patients exist/ do |patients_table|
  patients_table.hashes.each do |patient|
    Patient.create(name: patient[:name], gender: patient[:gender], start_date: patient[:start_date])
  end
end

Then /I definitely should see "(.*)" before "(.*)"/ do |e1, e2|
    page.body =~ /#{e1}.*#{e2}/m
end

Then /I definitely should not see "(.*)" before "(.*)"/ do |e1, e2|
  page.body =~ /#{e2}.*#{e1}/m
end



Then /I should see all the patients/ do
  # Make sure that all the patients in the app are visible in the table
  patients = Patient.all
  page.should have_css("table#patients tbody tr", :count => patients.length)
end
