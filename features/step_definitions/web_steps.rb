# -*- encoding : utf-8 -*-
Given /^I am on the homepage$/ do
  visit root_path
end

Given /^I am on the adminpage$/ do
  visit admin_root_path
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )uncheck "([^"]*)"$/ do |field|
  uncheck(field)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should have_no_content(text)
end

When /^I check "([^"]*)"$/ do |field|
  check(field)
end

When /^I attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  within(selector) do           # Did search WITHIN selector, I tried
    page.should have_content(text)
  end
end

When /^I follow "([^"]*)" within "([^"]*)"$/ do |link, selector|
  within(selector) do
    click_link(link)
  end
end

When /^I select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end


Given /^I am on "([^"]*)" "([^"]*)"$/ do |model,number|
  visit polymorphic_path(record_from_strings(model,number))
end

Then /^I should be on "([^"]*)" "([^"]*)"$/ do |model,number|
  current_path.should == polymorphic_path(record_from_strings(model,number))
end

Then /^I should not see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  within(selector) do           # Did search WITHIN selector, I tried
    page.should have_no_content(text)
  end
end

Then /^I should be on "([^"]*)"$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == page_name
  else
    assert_equal page_name, current_path
  end
end

When /^I select "([^"]*)" as "([^"]*)" date$/ do |date, field|
  select_date(date, :from => field)
end