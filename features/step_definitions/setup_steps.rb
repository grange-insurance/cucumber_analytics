Given /^the following(?: feature)? file(?: "([^"]*)")?:$/ do |file_name, file_text|
  @test_directory ||= @default_file_directory
  file_name ||= @default_feature_file_name

  File.open("#{@test_directory}/#{file_name}", 'w') { |file|
    file.write(file_text)
  }
end

When /^the file(?: "([^"]*)")? is parsed$/ do |file_name|
  @parsed_files ||= []
  @test_directory ||= @default_file_directory
  file_name ||= @default_feature_file_name

  @parsed_files << Cucumber::Analytics::ParsedFile.new("#{@test_directory}/#{file_name}")
end

When /^parameter delimiters of "([^"]*)" and "([^"]*)"$/ do |left_delimiter, right_delimiter|
  @left_delimiter = left_delimiter
  @right_delimiter = right_delimiter
end

Given /^a directory "([^"]*)"$/ do |directory_name|
  @test_directory = "#{@default_file_directory}/#{directory_name}"

  FileUtils.mkdir(@test_directory) unless File.exists?(@test_directory)
end

When /^the directory(?: "([^"]*)")? is read$/ do |directory_name|
  @test_directory = "#{@default_file_directory}/#{directory_name}" if directory_name

  @parsed_directory = Cucumber::Analytics::ParsedDirectory.new(@test_directory)
end

When /^the following step definition file:$/ do |file_text|
  File.open(@test_step_file_location, 'w') { |file|
    file.write(file_text)
  }
end
