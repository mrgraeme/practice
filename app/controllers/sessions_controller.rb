class SessionsController < ApplicationController
  
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
  
  
end
