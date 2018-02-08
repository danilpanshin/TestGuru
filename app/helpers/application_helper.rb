module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(project, author, repo)
    link_to  project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end


end
