#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'
Bundler::GemHelper.install_tasks

task :spec do
  desc "Run all specs with rcov"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = "spec/**/*_spec.rb"
  end
end

task :console do
  puts "Loading development console..."
  system("irb -r form_shui")
end
