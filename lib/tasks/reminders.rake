namespace :reminders do
  desc "Send reminder mailers"
  task send_due: :environment do
    puts ReminderMailer.send_due_emails
  end

  task send_overdue: :environment do
    puts ReminderMailer.send_overdue_emails
  end

  desc "Send weekly report"
  task send_weekly_report: :environment do
    puts ReminderMailer.send_weekly_report
  end
end
