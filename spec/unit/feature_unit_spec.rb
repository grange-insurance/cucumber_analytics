require 'spec_helper'

SimpleCov.command_name('Feature') unless RUBY_VERSION.to_s < '1.9.0'

describe 'Feature, Unit' do

  clazz = CucumberAnalytics::Feature

  it_should_behave_like 'a feature element', clazz
  it_should_behave_like 'a nested element', clazz
  it_should_behave_like 'a containing element', clazz
  it_should_behave_like 'a tagged element', clazz
  it_should_behave_like 'a bare bones element', clazz
  it_should_behave_like 'a prepopulated element', clazz

  before(:each) do
    @feature = clazz.new
  end

  it 'can be parsed from stand alone text' do
    source = 'Feature: '

    expect { clazz.new(source) }.to_not raise_error
  end

  it 'has a background - #background' do
    @feature.should respond_to(:background)
  end

  it 'can get and set its background - #background, #background=' do
    @feature.background = :some_background
    @feature.background.should == :some_background
    @feature.background = :some_other_background
    @feature.background.should == :some_other_background
  end

  it 'knows whether or not it presently has a background - has_background?' do
    @feature.background = :a_background
    @feature.has_background?.should be_true
    @feature.background = nil
    @feature.has_background?.should be_false
  end

  it 'has tests - #tests' do
    @feature.should respond_to(:tests)
  end

  it 'can get and set its tests - #tests, #tests=' do
    @feature.tests = :some_tests
    @feature.tests.should == :some_tests
    @feature.tests = :some_other_tests
    @feature.tests.should == :some_other_tests
  end

  it 'knows how many tests it has - #test_count' do
    @feature.tests = []
    @feature.test_count.should == 0
    @feature.tests = [:test_1, :test_2]
    @feature.test_count.should == 2
  end

  it 'contains backgrounds and tests' do
    tests = [:test_1, :test_2]
    background = :a_background
    everything = [background] + tests

    @feature.background = background
    @feature.tests = tests

    @feature.contains.should =~ everything
  end

  it 'starts with no background' do
    @feature.background.should == nil
  end

  it 'starts with no tests' do
    @feature.tests.should == []
  end

end