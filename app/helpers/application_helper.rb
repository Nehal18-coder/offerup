module ApplicationHelper
  def collapse_search_form
    if params[:q].blank?
      "collapse"
    else
      ""
    end
  end

  def link_to_show_or_back(
    object,
        show_content = "Show",
        back_content = "Back",
        options = {}
  )
    if request.path == url_for(object)
      link_to back_content, :back, options
    else
      link_to show_content, object, options
    end
  end
end
