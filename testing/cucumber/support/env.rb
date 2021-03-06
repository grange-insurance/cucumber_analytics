unless RUBY_VERSION.to_s < '1.9.0'
  require 'simplecov'
  SimpleCov.command_name('cucumber_tests')
end

require 'test/unit/assertions'
include Test::Unit::Assertions

# Ruby 1.8.x seems to have trouble if relative paths get too nested, so resolving the path before using it here
this_dir = File.expand_path(File.dirname(__FILE__))
require "#{this_dir}/../../../lib/cucumber_analytics"


DEFAULT_FEATURE_FILE_NAME = 'test_feature.feature'
DEFAULT_STEP_FILE_NAME = 'test_steps.rb'
DEFAULT_FILE_DIRECTORY = "#{this_dir}/../temp_files"
TEST_FILE_DIRECTORY = "#{this_dir}/../test_files"
TEST_STEP_FILE_LOCATION = "#{DEFAULT_FILE_DIRECTORY}/#{DEFAULT_STEP_FILE_NAME}"

SPEC_DIRECTORY = "#{this_dir}/../../spec"


Before do
  @default_feature_file_name = DEFAULT_FEATURE_FILE_NAME
  @default_step_file_name = DEFAULT_STEP_FILE_NAME
  @test_file_directory = TEST_FILE_DIRECTORY
  @default_file_directory = DEFAULT_FILE_DIRECTORY
  @test_step_file_location = TEST_STEP_FILE_LOCATION

  FileUtils.mkdir(@default_file_directory)
end

After do
  FileUtils.remove_dir(@default_file_directory, true)
end
