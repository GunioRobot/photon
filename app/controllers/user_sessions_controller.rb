class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t(:session_login_ok)
      redirect_back_or_default root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = t(:session_logout_ok)
    redirect_to root_url
  end
end
