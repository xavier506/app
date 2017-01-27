
if @bill_of_lading.liner == 'Evergreen'
  bg_image = "#{Rails.root}/app/assets/images/pdf/EVERGREEN.jpg"
else
  pdf.text 'No Shipper Selected', :size => 24, :align => :center
end

if bg_image
  pdf.image bg_image, :scale => 0.32 #:scale => 0.2311
  pdf.move_up 645
end


indent 30 do
  # # Shipper
  # pdf.bounding_box([0, pdf.cursor - 0], :width => 250, :height => 50) do
  #   pdf.text @bill_of_lading.shipper.upcase, :size => 7
  # end

  # #Consignee
  # pdf.bounding_box([0, pdf.cursor - 19], :width => 250, :height => 50) do
  #   pdf.text @bill_of_lading.consignee.upcase, :size => 7
  # end

  # #Mode
  # pdf.bounding_box([0, pdf.cursor - 17], :width => 250, :height => 10) do
  #   pdf.text @bill_of_lading.mode.upcase, :size => 7
  # end

  # #Departure Port
  # pdf.bounding_box([0, pdf.cursor - 10], :width => 250, :height => 10) do
  #   pdf.text @bill_of_lading.departure_port.upcase, :size => 7
  # end

  # #Country
  # pdf.bounding_box([0, pdf.cursor - 8], :width => 118, :height => 10) do
  #   pdf.text @bill_of_lading.country_name.to_s.upcase, :size => 7
  # end

  # #Discharge Port
  # pdf.bounding_box([130, pdf.cursor + 11], :width => 118, :height => 10) do
  #   pdf.text @bill_of_lading.discharge_port.upcase, :size => 7
  # end

  # #Observations
  # pdf.bounding_box([264, pdf.cursor + 27], :width => 220, :height => 24) do
  #   pdf.text @bill_of_lading.observations.upcase, :size => 7
  # end

  # #Item No.
  # pdf.bounding_box([0, pdf.cursor - 45], :width => 15, :height => 140) do
  #   pdf.text '1', :size => 7, :align => :center
  #   pdf.text '***', :size => 7, :align => :center
  # end

  # #Units
  # units_text = @bill_of_lading.units.to_s.upcase + " " + @bill_of_lading.unit_type.to_s.upcase
  # pdf.bounding_box([24, pdf.cursor + 140], :width => 60, :height => 140) do
  #   pdf.text units_text, :size => 7, :align => :center
  #   pdf.text '*********', :size => 7, :align => :center
  # end

  # #Description
  # pdf.bounding_box([95, pdf.cursor + 140], :width => 186, :height => 140) do
  #   pdf.text @bill_of_lading.description.upcase, :size => 7, :align => :center
  #   pdf.text @bill_of_lading.farm.upcase, :size => 7, :align => :center
  #   pdf.text '****************************************', :size => 7, :align => :center
  # end

  # #Volume
  # volume_text = @bill_of_lading.volume.to_s.upcase + " " + @bill_of_lading.volume_units.to_s.upcase
  # pdf.bounding_box([292, pdf.cursor + 140], :width => 65, :height => 140) do
  #   pdf.text volume_text, :size => 7, :align => :center
  #   pdf.text '*********', :size => 7, :align => :center
  # end

  # #Weight
  # weight_text = @bill_of_lading.gross_weight.to_s.upcase + " " + @bill_of_lading.weight_units.to_s.upcase
  # pdf.bounding_box([365, pdf.cursor + 140], :width => 50, :height => 140) do
  #   pdf.text weight_text, :size => 7, :align => :center
  #   pdf.text '*********', :size => 7, :align => :center
  # end

  # #Invoice
  # pdf.bounding_box([420, pdf.cursor + 140], :width => 65, :height => 140) do
  #   pdf.text @bill_of_lading.invoices.upcase, :size => 7, :align => :center
  #   pdf.text '*********', :size => 7, :align => :center
  # end
end
