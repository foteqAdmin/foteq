require 'rufus-scheduler'

SCHEDULER = Rufus::Scheduler.start_new

JOBFILES = File.expand_path('../jobs',__FILE__)

Dir[JOBFILES+"/*.rb"].each {|file| require file}
