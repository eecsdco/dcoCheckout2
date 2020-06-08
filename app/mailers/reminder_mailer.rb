class ReminderMailer < ApplicationMailer
  default :from => '"DCO Checkout System" <no-reply@eecs.umich.edu>',
          :reply_to => '"EECS Departmental Computing Organization" <help@eecs.umich.edu>'

  def checkout_email(record)
    @record = record
    mail(to: @record.borrower + '@umich.edu',
      subject: 'Checkout Notification for ' + @record.title.name)
  end

  def send_due_emails
    records = Record.where(in: nil)
      .where("due >= :min_time AND due < :max_time",
      {min_time: DateTime.now, max_time: DateTime.now + 2.hours})
    records.each do |record|
      due_email(record).deliver
    end
  end

  def due_email(record)
    @record = record
    mail(to: record.borrower + '@umich.edu',
      subject: "Your " + record.title.name + " is Due",
      template_name: 'due_email')
  end
  
  def send_weekly_report
    @records = Record.where(in: nil)
      .where("due <= ?", DateTime.now)
      .reorder(due: :desc)
    mail(to: 'dco4@eecs.umich.edu',
         subject: "Unreturned Items Report",
         template_name: 'weekly_report',
         reply_to: 'no-reply@eecs.umich.edu').deliver
  end

  def send_overdue_emails
    puts "send_overdue_emails"
    records = Record.where(in: nil)
      .where("due <= ?", DateTime.now)
    records.each do |record|
      overdue_email(record).deliver
    end
  end
  
  def send_doyoustillhavethis_emails
    put "send_doyoustillhavethis_emails"
    records = Record.where(in: nil)
    records.each do |record|
      puts "found record: " + record
      if record.borrower == "travigd"
        puts "found record from travigd: " + record
        #doyoustillhavethis_email(record).deliver
      end
    end
  end

  def doyoustillhavethis_email(record)
    puts "Sending overdue email to #{record.borrower}"
    @record = record
    mail(to: record.borrower + '@umich.edu',
      subject: "Status of Checked Out " + record.title.name,
      template_name: 'doyoustillhavethis_email')
  end

  def overdue_email(record)
    puts "Sending overdue email to #{record.borrower}"
    @record = record
    mail(to: record.borrower + '@umich.edu',
      subject: "Your " + record.title.name + ' is Overdue',
      template_name: 'overdue_email')
  end
end
