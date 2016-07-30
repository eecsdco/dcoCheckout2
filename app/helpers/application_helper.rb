module ApplicationHelper
  def uniqname
    request.env["REMOTE_USER"]
  end

  def short_text(text)
    if not text.nil? and text.length >= 50
      text[0..47] + '...'
    else
      text
    end
  end

end
