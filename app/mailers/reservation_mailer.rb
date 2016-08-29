class ReservationMailer < ApplicationMailer

  def checkin_mail (reservation)
    @res = reservation
      mail(to:'giada.terzani@gmail.com', subject: 'Bamboo B&B Roma Check-in info')
  end
end
