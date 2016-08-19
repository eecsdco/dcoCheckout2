namespace :reminders do
  desc "Send reminder mailers"
  task send: :environment do
    puts "Sending reminders..."
    puts ReminderMailer.send_reminders
  end

end
