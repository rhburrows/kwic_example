require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:v1) do |t|
    t.pattern = "test/kwic/test_kwic_v1.rb"
    t.libs << "test/support"
  end

  Rake::TestTask.new(:v2) do |t|
    t.pattern = "test/kwic/test_kwic_v2.rb"
    t.libs << "test/support"
  end

  Rake::TestTask.new(:all) do |t|
    t.pattern = "test/kwic/test_*.rb"
    t.libs << "test/support"
  end
end

desc "Run all tests"
task :test => 'test:all'

task :default => 'test'
