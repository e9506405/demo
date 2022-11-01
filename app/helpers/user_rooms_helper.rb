module UserRoomsHelper
  def open_room_record(user)
    @currentUserRooms = UserRoom.where(user_id: current_user.id)
    @currentUserRooms.each do |user_room|
        record = UserRoom.where(user_id: user.id, room_id: user_room.room_id)
        if record.nil?
            
    end
    return nil
  end
end
