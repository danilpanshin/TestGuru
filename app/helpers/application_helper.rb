module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(project, author, repo)
    link_to  project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end


end
