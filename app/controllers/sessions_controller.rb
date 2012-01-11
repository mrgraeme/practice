class SessionsController < ApplicationController
  USER, PASSWORD = 'graeme', 'secret'
  
  before_filter :authentication_check, :except => [:index, :show]
  
  def create
    @passion = Passion.find(params[:passion_id])
    @session = @passion.sessions.create(params[:session])
    redirect_to passion_path(@passion)
  end
  
  def destroy
    @passion = Passion.find(params[:passion_id])
    @session = @passion.sessions.find(params[:id])
    @session.destroy
    redirect_to passion_path(@passion)
  end
  
  private

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end
  
  
end
