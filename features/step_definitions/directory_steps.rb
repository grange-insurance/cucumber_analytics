Then /^the directory is found to have the following properties:$/ do |properties|
  properties = properties.rows_hash

  properties.each do |property, expected_value|
    assert { expected_value == @parsed_directory.send(property.to_sym).to_s }
  end
end

Then /^there are "([^"]*)" undefined steps$/ do |step_count|
  assert { @parsed_directory.undefined_steps.count == step_count }
end

Then /^there are "([^"]*)" defined steps$/ do |step_count|
  assert { @parsed_directory.defined_steps.count == step_count }
end

When /^the undefined steps "([^"]*)" keywords are:$/ do |keywords, steps|
  assert { @parsed_directory.undefined_steps(keywords == 'with' ? true : false).sort == steps.raw.flatten.sort }
end

When /^the defined steps "([^"]*)" keywords are:$/ do |keywords, steps|
  assert { @parsed_directory.defined_steps(keywords == 'with' ? true : false).sort == steps.raw.flatten.sort }
end
