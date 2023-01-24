module CommonActions
  extend ActiveSupport::Concern

  def set_categories
    @categories = Category.all
  end

  def guest?
    if user_signed_in?
      current_user.email == "guest@example.com"
    else
      false
    end
  end
end
