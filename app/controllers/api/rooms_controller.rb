class Api::RoomsController < ApplicationController
  before_action :set_api_room, only: [:show, :edit, :update, :destroy]

  # GET /api/rooms
  # GET /api/rooms.json
  def index
    @api_rooms = Rooms.where(:subroom => 0)
  end

  # GET /api/rooms/1
  # GET /api/rooms/1.json
  def show
  end

  # GET /api/rooms/new
  def new
    @api_room = Rooms.new
  end

  # GET /api/rooms/1/edit
  def edit
  end

  # POST /api/rooms
  # POST /api/rooms.json
  def create
    @api_room = Rooms.new(api_room_params)

    respond_to do |format|
      if @api_room.save
        format.html { redirect_to @api_room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @api_room }
      else
        format.html { render :new }
        format.json { render json: @api_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/rooms/1
  # PATCH/PUT /api/rooms/1.json
  def update
    respond_to do |format|
      if @api_room.update(api_room_params)
        format.html { redirect_to @api_room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_room }
      else
        format.html { render :edit }
        format.json { render json: @api_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/rooms/1
  # DELETE /api/rooms/1.json
  def destroy
    @api_room.destroy
    respond_to do |format|
      format.html { redirect_to api_rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_room
      @api_room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_room_params
      params.fetch(:api_room, {})
    end
end
