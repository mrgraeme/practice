class PassionsController < ApplicationController
USER, PASSWORD = 'graeme', 'secret'

before_filter :authentication_check, :except => [:index, :show]

  # GET /passions
  # GET /passions.json
  def index
    @passions = Passion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @passions }
    end
  end

  # GET /passions/1
  # GET /passions/1.json
  def show
    @passion = Passion.find(params[:id])
    @sessions = @passion.sessions.all

    @practice_time = 0
    @sessions.each do |session|
      @practice_time += session.time.to_i
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @passion }
    end
  end

  # GET /passions/new
  # GET /passions/new.json
  def new
    @passion = Passion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @passion }
    end
  end

  # GET /passions/1/edit
  def edit
    @passion = Passion.find(params[:id])
  end

  # POST /passions
  # POST /passions.json
  def create
    @passion = Passion.new(params[:passion])

    respond_to do |format|
      if @passion.save
        format.html { redirect_to @passion, notice: 'Passion was successfully created.' }
        format.json { render json: @passion, status: :created, location: @passion }
      else
        format.html { render action: "new" }
        format.json { render json: @passion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /passions/1
  # PUT /passions/1.json
  def update
    @passion = Passion.find(params[:id])

    respond_to do |format|
      if @passion.update_attributes(params[:passion])
        format.html { redirect_to @passion, notice: 'Passion was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @passion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passions/1
  # DELETE /passions/1.json
  def destroy
    @passion = Passion.find(params[:id])
    @passion.destroy

    respond_to do |format|
      format.html { redirect_to passions_url }
      format.json { head :ok }
    end
  end

  private

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end
end


