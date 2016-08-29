class ReservationController < ApplicationController
  def index

  end



  def today

    today = Date.parse(params[:date])
    @date = today
    @presence  = Wubookreservation.where(status:{ '$in': [1, 4] })
                     .where(:date_arrival.lte => today)
                     .where(:date_departure.gt => today)
                     .order_by(:date_departure => 'asc')
    @ci  = Wubookreservation.where(status:{ '$in': [1, 4] })
                     .where(:date_arrival => today)
                     .order_by(:date_departure => 'asc')
    @co  = Wubookreservation.where(status:{ '$in': [1, 4] })
                     .where(:date_departure => today)
                     .order_by(:date_departure => 'asc')

  end

  def checkinmail

    res_code = params[:res_code]
    res = Wubookreservation.find_by(:reservation_code => res_code)
    ReservationMailer.checkin_mail(res).deliver_now

    redirect_to :back
  end


  def view
    date_from = Date.parse(params[:date_from])
    date_to = Date.parse(params[:date_to]) + 1.days
    @date_from =date_from
    @date_to=date_to
    @reservations = Wubookreservation.where(status:{ '$in': [1, 4] })
                        .where(:date_departure.gte => date_from)
                        .where(:date_departure.lte => date_to)
                        .order_by(:date_departure => 'asc')


    @reservations_ly = Wubookreservation.where(status:{ '$in': [1, 4] })
                        .where(:date_departure.gte => date_from - 1.years)
                        .where(:date_departure.lte => date_to - 1.years )
                        .order_by(:date_departure => 'asc')


    @total = Wubookreservation.where(:date_departure.gte => date_from)
                 .where(:date_arrival.lte => date_to)
                 .sum(:amount)

    @total_confirmed = Wubookreservation.where(status:{ '$in': [1, 4] })
                 .where(:date_departure.gte => date_from)
                 .where(:date_departure.lte => date_to)
                 .sum(:amount)

    @total_cancelled  = @total-@total_confirmed


    @n_res  =Wubookreservation.where(:date_departure.gte => date_from)
                         .where(:date_arrival.lte => date_to)
                         .count()
    @n_res_confirmed  =Wubookreservation.where(:status => 1)
                           .where(:date_departure.gte => date_from)
                           .where(:date_arrival.lte => date_to)
                           .count()

    @n_res_confirmed_ly  =Wubookreservation.where(:status => 1)
                           .where(:date_departure.gte => date_from -1.years)
                           .where(:date_arrival.lte => date_to -1.year )
                           .count()

    @n_res_cancelled  = @n_res - @n_res_confirmed


    tot_day=0
    @reservations.each() do |r|
      tot_day += r.daybefore()

    end
    @avg_before = tot_day / @n_res_confirmed.to_i

    tot_day_ly=0
    @total_ly=0
    @reservations_ly.each() do |r|
      tot_day_ly += r.daybefore()
      @total_ly += r.amount
    end
    if @n_res_confirmed_ly.to_i > 0
      @avg_before_ly = tot_day_ly / @n_res_confirmed_ly.to_i
    else
      @avg_before_ly = "NA"
    end
  end
end
