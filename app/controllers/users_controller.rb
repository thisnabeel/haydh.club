class UsersController < ApplicationController

    def companions
        companions = User.all.where(period: true)
        render json: companions
    end

    def toggle_period
        user = User.find_by(id: params[:user_id])
        user.update!(period: !user.period)
        # CompanionsChannel.broadcasting_for(user)
        if user.period == true
           action = { joined: user }
        else
            action = { left: user }
        end
        ActionCable.server.broadcast "companions_channel", action
        render json: user
    end
end