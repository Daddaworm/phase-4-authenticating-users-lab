class SessionsController < ApplicationController

    # POST /login
    def create
        # returns the logged in user
        # sets the user ID in the session
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        render json: user
    end

    # DELETE /logout
    def destroy
        # returns no content
        # deletes the user ID from the session
        session.delete :user_id
        head :no_content
    end


    private

    def find_user
        User.find_by(params[:id])
    end

    def user_params
        params.permit(:username)
    end
end
