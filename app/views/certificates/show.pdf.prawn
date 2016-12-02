logo = "#{Rails.root}/app/assets/images/co-header.png"
    image logo, :at => [285,750], :width => 350
pdf.move_down(25)
pdf.text "Shipper"
pdf.text @co.shipper, :size => 8
pdf.move_down(15)
pdf.text "Consignee"
pdf.text @co.consignee, :size => 8
pdf.move_down(15)
pdf.text "Farm"
pdf.text @co.farm, :size => 8
pdf.move_down(15)
pdf.text "Country"
pdf.text @co.country, :size => 8
pdf.move_down(15)
pdf.text "Departure Port"
pdf.text @co.departure_port, :size => 8
pdf.move_down(15)
pdf.text "Discharge Port"
pdf.text @co.discharge_port, :size => 8
pdf.move_down(15)
pdf.text "Observations"
pdf.text @co.observations, :size => 8
