module ApplicationHelper
  def uniqname
    request.env["REMOTE_USER"]
    # TODO: Add logic for unqiname based on environment
  end

  def short_text(text)
    if not text.nil? and text.length >= 50
      text[0..47] + '...'
    else
      text
    end
  end

  def format_datetime(datetime)
    datetime.strftime(Rails.configuration.datetime_format)
  end

  def current_office_id
    Rails.configuration.checkout_computers[request.remote_addr]
  end

end
