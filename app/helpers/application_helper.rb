module ApplicationHelper
  def admin?
    controller.class.name.split("::").first=="Admin"
  end

  def owner?
    controller.class.name.split("::").first=="Owner"
  end
end
