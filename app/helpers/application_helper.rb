module ApplicationHelper
  PP_CONFIG = Rails.application.secrets.protected_planet

  URL_TO_PROTECTED_AREA = -> wdpa_id { File.join(PP_CONFIG["root_url"], wdpa_id.to_s) }
  def protected_planet_path page
    {
      root: PP_CONFIG["root_url"],
      blog: PP_CONFIG["blog_url"],
      about: File.join(PP_CONFIG["root_url"], "about"),
      terms: File.join(PP_CONFIG["root_url"], "terms"),
      resources: File.join(PP_CONFIG["root_url"], "resources"),
      un_list: PP_CONFIG["un_list_url"],
      search: File.join(PP_CONFIG["root_url"], PP_CONFIG["parcc_search_path"]),
      protected_area: URL_TO_PROTECTED_AREA
    }[page]
  end

  DEFAULT_LANGUAGE = "English"
  LANGUAGES = {"en" => "English", "fr" => "French"}
  def current_language
    LANGUAGES[@cms_site.path] || DEFAULT_LANGUAGE
  rescue
    DEFAULT_LANGUAGE
  end
end
