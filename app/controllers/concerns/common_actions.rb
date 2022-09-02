module CommonActions
  extend ActiveSupport::Concern
 
  def set_categories
    @categories = Category.all
  end

  def guest? 
    if user_signed_in?
      if current_user.email == "guest@example.com"
        true
      else 
        false
      end
    else 
      false
    end
  end
end
