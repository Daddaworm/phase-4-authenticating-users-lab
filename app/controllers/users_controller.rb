class UsersController < ApplicationController

    # GET /me
    def show
        user = User.find_by(id: session[:user_id])
        # byebug
        if user
            render json: user
        else
            render json: { error: "Not Authorized" }, status: :unauthorized
        end
    end


end
