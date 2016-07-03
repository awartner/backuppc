require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

require 'chef/version'

RuboCop::RakeTask.new(:ruby)

FoodCritic::Rake::LintTask.new

RSpec::Core::RakeTask.new(:unit) do |t|
  t.rspec_opts = [].tap do |a|
    a.push('--color')
    a.push('--format progress')
  end.join(' ')
end

desc 'Run all tests'
task test: [:unit]

task default: [:test]
