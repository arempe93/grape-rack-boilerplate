# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/boot', __FILE__)

load "tasks/otr-activerecord.rake"

Dir[File.expand_path('./lib/tasks/*.rake', __dir__)].each do |initializer|
  load initializer
end
