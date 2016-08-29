require 'xmlrpc/client'

class WubookController < ApplicationController

  def index
  end

  def token
    token_data = server.call("acquire_token", 'AT035', 'Giugno2016', 'bamboo:rome')
    status = token_data[0]
    @token = token_data[1]
    logger.info(status)
    logger.info(@token)
    @token
  end

  def acquire

    token_data = server.call("acquire_token", 'AT035', 'Giugno2016', 'bamboo:rome')
    status = token_data[0]
    @token = token_data[1]
    logger.info(status)
    logger.info(@token)

  end
  
  def fetch_reservation

      start_date = Date.parse(params[:date_from])
      end_date =  Date.parse(params[:date_to])

      res_data = server.call('fetch_bookings',token, '1377875938', start_date.strftime("%d/%m/%Y"), end_date.strftime("%d/%m/%Y"), 0, 0)
      res_data[1].each() do |r|

        puts(r["reservation_code"])

        if Wubookreservation.where( reservation_code: r["reservation_code"]).exists?
          logger.info ("Reservation already fetched")
          logger.info ("Reservation already fetched")
          res = Wubookreservation.find_by( reservation_code: r["reservation_code"]);
          res.status =  r["status"]
          res.status_reason =  r["status_reason"]
          res.save!
        else
          Wubookreservation.create(r)
        end


      end

      redirect_to action: "index"
  end

  def fetch_all_reservation

    start_date = Date.parse(params[:date_from])

    fetched = 0
    created = 0

    while start_date < Date.today

      from  = start_date
      to  = from + 1.month

      res_data = server.call('fetch_bookings',token, '1377875938', from.strftime("%d/%m/%Y"), to.strftime("%d/%m/%Y"), 0, 0)

      res_data[1].each() do |r|
        fetched += 1
        if Wubookreservation.where( reservation_code: r["reservation_code"]).exists?
          logger.info ("Reservation already fetched")
          res = Wubookreservation.find_by( reservation_code: r["reservation_code"]);
          res.status =  r["status"]
          res.status_reason =  r["status_reason"]
          res.save!
        else
          Wubookreservation.create(r)
          created += 1
        end

      end

      start_date = start_date + 1.month
    end
    flash[:created] = "Reservation created" + created.to_s
    flash[:fetched] = "Reservation fetched" + fetched.to_s

    redirect_to action: "index"
  end

  def fetch_new_reservation
    res_data = server.call('fetch_new_bookings',token, '1377875938', 0, 1)

    fetched = 0
    created = 0
    res_data[1].each() do |r|
      fetched += 1
      if Wubookreservation.where( reservation_code: r["reservation_code"]).exists?
        logger.info ("Reservation already fetched")
        res = Wubookreservation.find_by( reservation_code: r["reservation_code"]);
        res.status =  r["status"]
        res.status_reason =  r["status_reason"]
        res.save!
      else
        Wubookreservation.create(r)
        created += 1
      end

    end
    flash[:created] = "Reservation created" + created.to_s
    flash[:fetched] = "Reservation fetched" + fetched.to_s

    redirect_to action: "index"
  end

  def fetch_rooms
    response = server.call("fetch_rooms", token, '1377875938')
    response[1].each() do |r|
      if Rooms.where( id: r["id"]).exists?
        logger.info ("Room already fetched")
      else
        Rooms.create(r)
      end
    end

    redirect_to action: "index"

  end


  def server
    server = XMLRPC::Client.new2 ("https://wubook.net/xrws/")
    server.instance_variable_get("@http").verify_mode = OpenSSL::SSL::VERIFY_NONE
    #server.set_debug
    server
  end

  def viewreservations

  end
end
