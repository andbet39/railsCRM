class CustomerController < ApplicationController
  def index

    @customers =Customer.all
  end

  def extract

    @res = Wubookreservation.where(:customer_extracted => nil)

    @res.each() do |r|

      if !Customer.where(:mail => r.customer_mail).exists?
        newcus = Customer.new()
        newcus.mail = r.customer_mail
        newcus.country = r.customer_country
        newcus.surname = r.customer_surname
        newcus.phone = r.customer_phone
        newcus.name = r.customer_name
        newcus.address = r.customer_address
        newcus.language = r.customer_language
        newcus.zip = r.customer_zip
        newcus.city = r.customer_city

        newcus.save!

        r.customer_extracted = true
        r.save!
      end
    end

  end
end
