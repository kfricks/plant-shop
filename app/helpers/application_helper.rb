module ApplicationHelper
    def active_class(link_path)
      current_page?(link_path) ? "c-navigation__link--active" : ""
    end
end
