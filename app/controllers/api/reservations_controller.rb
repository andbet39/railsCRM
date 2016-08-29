class Api::ReservationsController < ApplicationController
  before_action :set_api_reservation, only: [:show, :edit, :update, :destroy]

  # GET /api/reservations
  # GET /api/reservations.json
  def index

    date_from = params[:date_from]
    date_to = params[:date_to]

    res = Wubookreservation.where(status:{ '$in': [1, 4] }).where(:date_departure.gte => date_from).where(:date_arrival.lte => date_to)
    @api_reservations =[]
    res.each() do |r|
      rooms =  r.rooms.split(",")


      rooms.each() do |rr|
        r.rooms=rr
        @api_reservations << r.dup
       end
    end
  end

  # GET /api/reservations/1
  # GET /api/reservations/1.json
  def show
  end

  # GET /api/reservations/new
  def new
    @api_reservation = Wubookreservation.new
  end

  # GET /api/reservations/1/edit
  def edit
  end

  # POST /api/reservations
  # POST /api/reservations.json
  def create
    @api_reservation = Wubookreservation.new(api_reservation_params)

    respond_to do |format|
      if @api_reservation.save
        format.html { redirect_to @api_reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @api_reservation }
      else
        format.html { render :new }
        format.json { render json: @api_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/reservations/1
  # PATCH/PUT /api/reservations/1.json
  def update
    respond_to do |format|
      if @api_reservation.update(api_reservation_params)
        format.html { redirect_to @api_reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_reservation }
      else
        format.html { render :edit }
        format.json { render json: @api_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/reservations/1
  # DELETE /api/reservations/1.json
  def destroy
    @api_reservation.destroy
    respond_to do |format|
      format.html { redirect_to api_reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_reservation
      @api_reservation = Wubookreservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_reservation_params
      params.fetch(:api_reservation, {})
    end
end
