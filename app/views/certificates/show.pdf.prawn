bg_image = "#{Rails.root}/app/assets/images/pdf/blank_co.png"
  pdf.image bg_image, :scale => 0.32 #:scale => 0.2311
  pdf.move_up 645

indent 30 do
  # Shipper
  pdf.text @co.shipper.upcase, :size => 7

  #Consignee
  pdf.move_down(45)
  pdf.text @co.consignee.upcase, :size => 7

  #Mode
  pdf.move_down(35)
  pdf.text @co.mode.upcase, :size => 7

  #Departure Port
  pdf.move_down(11)
  pdf.text @co.departure_port.upcase, :size => 7

  #Country
  pdf.move_down(11)
  pdf.text @co.country.upcase, :size => 7

  #Discharge Port
  indent 130 do
    pdf.move_up(10)
    pdf.text @co.discharge_port.upcase, :size => 7
  end

  #Observations
  indent 265 do
    pdf.move_up(20)
    pdf.text @co.observations.upcase, :size => 7
  end

  #Item No.
  pdf.move_down(60)
  pdf.text '1', :size => 8
  pdf.text '***'

  #Units
  indent 28 do
    pdf.move_up(23)
    pdf.text @co.units.to_s, :size => 7
    pdf.text '************'
  end

  #Description
  indent 100 do
    pdf.move_up(23)
    pdf.text @co.description.upcase, :size => 7
    pdf.text @co.farm.upcase, :size => 7
    pdf.text '***********************************'
  end

  #Volume
  indent 292 do
    pdf.move_up(23)
    pdf.text @co.volume.to_s.upcase, :size => 7
    pdf.text '*********'
  end

  #Weight
  indent 365 do
    pdf.move_up(23)
    pdf.text @co.gross_weight.to_s.upcase, :size => 7
    pdf.text '*********'
  end

  #Invoice
  indent 420 do
    pdf.move_up(23)
    pdf.text @co.invoices.upcase, :size => 7
    pdf.text '**********'
  end
end
