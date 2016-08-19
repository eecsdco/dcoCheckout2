namespace :reminders do
  desc "Send reminder mailers"
  task send_due: :environment do
    puts ReminderMailer.send_due_emails
  end

  task send_overdue: :environment do
    puts ReminderMailer.send_overdue_emails
  end
end
