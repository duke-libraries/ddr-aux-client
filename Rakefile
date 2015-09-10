require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

DDR_AUX_VERSION = "1.0.0.rc2"
DDR_AUX_DOWNLOAD = "https://github.com/duke-libraries/ddr-aux/archive/v#{DDR_AUX_VERSION}.zip"
DDR_AUX_ZIP = "ddr-aux.zip"
DDR_AUX_HOST = "127.0.0.1"
DDR_AUX_PORT = "3030"

namespace :tmp do
  desc "Create tmp directory"
  task :create do
    system "mkdir -p tmp"
  end
end

namespace :ddr_aux do
  desc "Cleanup ddr-aux app"
  task :clean do
    Dir.chdir("tmp") do
      system "rm -rf ddr-aux"
      system "rm", DDR_AUX_ZIP
    end
  end

  desc "Download ddr-aux release"
  task :download => ["tmp:create"] do
    Dir.chdir("tmp") do
      system "curl", "-kL", "-o", DDR_AUX_ZIP, DDR_AUX_DOWNLOAD
    end
  end

  desc "Unzip ddr-aux download"
  task :unzip do
    Dir.chdir("tmp") do
      system "unzip", DDR_AUX_ZIP
      system "mv ddr-aux-#{DDR_AUX_VERSION} ddr-aux"
    end
  end

  desc "Initialize ddr-aux app"
  task :init do
    Dir.chdir("tmp/ddr-aux") do
      system "bin/bundle install"
      system "bin/bundle exec bin/rake db:setup"
    end
    puts "ddr-aux app installed."
  end

  desc "Install ddr-aux app"
  task :install => [:clean, :download, :unzip, :init]

  desc "Start ddr-aux development server"
  task :start do
    Dir.chdir("tmp/ddr-aux") do
      system("bin/bundle exec bin/rails server -d -b #{DDR_AUX_HOST} -p #{DDR_AUX_PORT}")
    end
    puts "ddr-aux development server started."
  end

  desc "Stop ddr-aux development server"
  task :stop do
    Dir.chdir("tmp/ddr-aux") do
      system "kill -s QUIT $(cat tmp/pids/server.pid)"
    end
    puts "ddr-aux development server stopped."
  end
end

desc "CI build"
task :ci do
  unless Dir.exist?("tmp/ddr-aux")
    Rake::Task["ddr_aux:install"].invoke
  end
  Rake::Task["ddr_aux:start"].invoke
  begin
    Rake::Task["spec"].invoke
  ensure
    Rake::Task["ddr_aux:stop"].invoke
  end
end
