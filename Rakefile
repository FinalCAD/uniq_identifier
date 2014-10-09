require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:generators) do |task|
  task.pattern = 'spec/generators/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:uniq_identifier) do |task|
  task.pattern = 'spec/uniq_identifier/**/*_spec.rb'
end

task :default => [ :spec ]

desc 'Run all specs'
task 'spec' do
  Rake::Task['generators'].invoke
  return_code1 = $?.exitstatus

  Rake::Task['uniq_identifier'].invoke
  return_code2 = $?.exitstatus

  fail if return_code1 != 0 || return_code2 != 0
end

desc 'Run specs for all adapters'
task :spec_all do
  %w[active_record mongoid].each do |model_adapter|
    puts "ADAPTER = #{model_adapter}"
    system "ADAPTER=#{model_adapter} rake"
  end
end
