require 'spec_helper'

SimpleCov.command_name('Outline') unless RUBY_VERSION.to_s < '1.9.0'

describe 'Outline, Unit' do

  clazz = CucumberAnalytics::Outline

  it_should_behave_like 'a feature element', clazz
  it_should_behave_like 'a nested element', clazz
  it_should_behave_like 'a containing element', clazz
  it_should_behave_like 'a tagged element', clazz
  it_should_behave_like 'a bare bones element', clazz
  it_should_behave_like 'a prepopulated element', clazz
  it_should_behave_like 'a test element', clazz


  it 'can be parsed from stand alone text' do
    source = 'Scenario Outline: '

    expect { clazz.new(source) }.to_not raise_error
  end


  before(:each) do
    @outline = clazz.new
  end


  it 'has examples - #examples' do
    @outline.should respond_to(:examples)
  end

  it 'can get and set its examples - #examples, #examples=' do
    @outline.examples = :some_examples
    @outline.examples.should == :some_examples
    @outline.examples = :some_other_examples
    @outline.examples.should == :some_other_examples
  end

  it 'starts with no examples' do
    @outline.examples.should == []
  end

  it 'contains steps and examples' do
    steps = [:step_1, :step_2, :step_3]
    examples = [:example_1, :example_2, :example_3]
    everything = steps + examples

    @outline.steps = steps
    @outline.examples = examples

    @outline.contains.should =~ everything
  end

end