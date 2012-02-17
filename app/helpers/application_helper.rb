module ApplicationHelper
  def title
    base_title = "Bug Tracker"

    if @title.nil? 
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "Bug Tracker", :class => "round")
  end
end
