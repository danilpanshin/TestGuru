module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(project, author, repo)
    link_to project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-warning'
    end
  end

  def link_to_select_language
    if I18n.locale == I18n.default_locale
      link_to 'English', { lang: 'en' }, class: :btn
    else
      link_to 'Русский', { lang: 'ru' }, class: :btn
    end
  end
end
