# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#
env :PATH, ENV['PATH']

# Example:
#
set :output, "/w/web/dco-checkout2/log/whenever.log"
set :environment, "development"
#

every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "ReminderMailer.send_reminders"
#   rake "some:great:rake:task"
  rake 'reminders:send_due'
end

every 1.days do
  rake 'reminders:send_overdue'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
