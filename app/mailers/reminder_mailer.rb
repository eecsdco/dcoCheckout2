class ReminderMailer < ApplicationMailer
  default :from => '"DCO Checkout System" <no-reply@eecs.umich.edu>',
          :reply_to => '"EECS Departmental Computing Organization" <help@eecs.umich.edu>'

  def checkout_email(record)
    @record = record
    mail(to: @record.borrower + '@umich.edu',
      subject: 'Checkout Notification for ' + @record.title.name)
  end

  def send_reminders
    # this is run every two hours by whenever
    send_due_emails
    send_overdue_emails
  end

  def send_due_emails
    records = Record.where(in: nil)
      .where("due >= :min_time AND due < :max_time",
      {min_time: DateTime.now - 2.hours, max_time: DateTime.now})
    records.each do |record|
      due_email(record).deliver
    end
  end

  def due_email(record)
    @record = record
    mail(to: record.borrower + '@umich.edu',
      subject: record.title.name + " is Due",
      template_name: 'due_email')
  end

  def send_overdue_emails
    records = Record.where(in: nil)
      .where("due >= ?", DateTime.now)
    records.each do |record|
      overdue_email(record).deliver
    end
  end

  def overdue_email(record)
    @record = record
    mail(to: record.borrower + '@umich.edu',
      subject: record.title.name + ' is Overdue',
      template_name: 'overdue_email')
  end
end
