module ApplicationHelper
  def uniqname
    request.env["REMOTE_USER"]
  end

  def active_if(item)
    path = request.original_fullpath
  end
end
