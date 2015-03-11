module UsersHelper

  def action_buttons(user)
    case current_user.friendship_status(user) when "friends"
      link_to "Cancel Friendship", friendships_path(current_user.friendship_relation(user)), method: :DELETE
    when "pending"
      link_to "Cancel Request", friendship_path(current_user.friendship_relation(user)), method: :DELETE
    when "requested"
      link_to "Accept", accept_friendship_path(current_user.friendship_relation(user)), method: :PUT
    when "not_friends"
      link_to "Add as friend", friendships_path(user_id: user.id), method: :POST
    end      
  end

end
