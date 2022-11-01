class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show, :destroy]

      def index
        @users = User.all

        # UserRoomsテーブルからログインユーザーが登録されているレコードを抽出する
			  @currentUserRooms = UserRoom.where(user_id: current_user.id)

          #Entry内のuser_idがMYPAGEのparams.idと同じEntry
		    @userEntry = Entry.where(user_id: @user.id)
		    	#@user.idとcurrent_user.idが同じでなければ
			    unless @user.id == current_user.id
			      @currentUserEntry.each do |cu|
			        @userEntry.each do |u|
			          #もしcurrent_user側のルームidと＠user側のルームidが同じであれば存在するルームに飛ぶ
			          if cu.room_id == u.room_id then
			            @isRoom = true
			            @roomId = cu.room_id
			          end
			        end
			      end
			      #ルームが存在していなければルームとエントリーを作成する
			      unless @isRoom
			        @room = Room.new
			        @entry = Entry.new
			      end
			    end
	  	end

      end

      def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          log_in(@user)
          redirect_to profile_path
        else
          render 'new'
        end
      end
    
      def show
        @user = User.find(current_user.id)
      end
    
      def destroy
        current_user.destroy
        redirect_to signup_path
      end
    
      private
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

end
