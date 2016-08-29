class ImportController < ApplicationController
  require 'csv'
  
  def index
  end

  def csv
    
    csvfile = params[:file]
    
    reservation = CSV.read(csvfile.path)
    
    reservation.each() do |r|
      puts(r[0])
    end
    
  end
end
