class ExpediaCollectController < ApplicationController
  def index

  end


  def view
    date_from = Date.parse(params[:date_from])
    date_to = Date.parse(params[:date_to]) + 1.days

    @res = Wubookreservation
               .where(status:{ '$in': [1, 4] })
               .where(:date_departure.gte => date_from)
               .where(:date_departure.lte => date_to)
               .where(:customer_notes.not => /.*Hotel Collect Booking.*/)
               .where(:id_channel=>1)
               .order_by(:date_departure => 'asc')
  end
end
