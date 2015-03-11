module UsersHelper

  def action_buttons(user)
    case current_user.friendship_status(user) when "friends"
      "Remove Friendship"
    when "pendind"
      "Cancel request"
    when "requested"
      "Accept or deny"
    when "not_friends"
      "Add as a friend"
    end      
  end

end
