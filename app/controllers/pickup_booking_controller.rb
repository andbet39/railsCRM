class PickupBookingController < ApplicationController
  layout 'pickup'
  def index
    res_code = params[:res_code]
    @pickup = Pickup.new
    @res = Wubookreservation.find_by(:reservation_code => res_code)

  end

  def check
    @pickup = Pickup.new(pickup_params)

    respond_to do |format|
      if @pickup.save
        format.html { redirect_to @pickup, notice: 'Pickup was successfully created.' }
      else
        @res = Wubookreservation.find_by(:reservation_code => @pickup.res_code)
        format.html { render :index }
      end
    end
  end

  def confirm
  end

  def view
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pickup
    @pickup = Pickup.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pickup_params
    params.require(:pickup).permit(:customer_name, :customer_surname, :customer_email,:customer_phone, :res_code , :passengers, :airport, :terminal, :arrival_time, :arrival_date, :flight_number)
  end
end
