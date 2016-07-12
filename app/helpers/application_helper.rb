module ApplicationHelper

  # Activate a navigation tab given a controller and and action
  #
  def activate_nav_tab controller, action
    (controller == params[:controller] and action == params[:action]) ? 'active' : ''
  end

end
