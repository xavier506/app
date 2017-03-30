bg_image = "#{Rails.root}/app/assets/images/pdf/blank_phyto.jpg"
pdf.image bg_image, :scale => 0.68
pdf.move_up 665
indent 10 do
  #  pdf.transparent(0.5) { pdf.stroke_bounds }
  #Number
  pdf.bounding_box([430, pdf.cursor - 27], :width => 65, :height => 10) do
    pdf.text @phytosanitary.number.to_s, :size => 10, :align => :left, :style => :bold
  end

  # Exporter
  pdf.bounding_box([0, pdf.cursor - 47], :width => 235, :height => 50) do
    pdf.text @phytosanitary.exporter.upcase, :size => 7
  end

  #Consignee
  pdf.bounding_box([238, pdf.cursor + 50], :width => 290, :height => 50) do
    pdf.text @phytosanitary.receiver.upcase, :size => 7
  end

  #Organization
  pdf.bounding_box([0, pdf.cursor - 17], :width => 160, :height => 42) do
    pdf.text @phytosanitary.organization.upcase, :size => 7
  end

  #Place of Origin
  pdf.bounding_box([162, pdf.cursor + 42], :width => 73, :height => 42) do
    pdf.text @phytosanitary.place_of_origin.upcase, :size => 7
  end

  #Point of Entry
  pdf.bounding_box([237, pdf.cursor + 42], :width => 90, :height => 42) do
    pdf.text @phytosanitary.point_of_entry.upcase, :size => 7
  end

  #Mode & Point of Exit
  exitext = @phytosanitary.mode.upcase + ' ' + @phytosanitary.point_of_exit.upcase
  pdf.bounding_box([330, pdf.cursor + 42], :width => 200, :height => 42) do
    pdf.text exitext, :size => 7
  end

  #Description
  pdf.bounding_box([0, pdf.cursor - 22], :width => 530, :height => 35) do
    pdf.text @phytosanitary.description.upcase, :size => 7
  end

  #Additional Declaration
  pdf.bounding_box([0, pdf.cursor - 70], :width => 530, :height => 55) do
    pdf.text @phytosanitary.additional_declaration.upcase, :size => 7
  end

  #Place of Issue
  pdf.bounding_box([285, pdf.cursor - 20], :width => 245, :height => 20) do
    pdf.text @phytosanitary.place_of_issue.upcase, :size => 7
  end

  #Treatment Date
  pdf.bounding_box([75, pdf.cursor + 5], :width => 195, :height => 20) do
    pdf.text @phytosanitary.treatment_date.to_s, :size => 7
  end

  #Issue Date
  pdf.bounding_box([300, pdf.cursor + 0], :width => 230, :height => 25) do
    pdf.text @phytosanitary.issue_date.to_s, :size => 7
  end

  #Treatment
  pdf.bounding_box([75, pdf.cursor + 20], :width => 195, :height => 20) do
    pdf.text @phytosanitary.treatment.upcase, :size => 7
  end

  #Inspector
  pdf.bounding_box([280, pdf.cursor - 24], :width => 130, :height => 80) do
    pdf.text @phytosanitary.inspector.upcase, :size => 7
  end

  #Active Ingredient
  pdf.bounding_box([75, pdf.cursor + 100], :width => 195, :height => 20) do
    pdf.text @phytosanitary.active_ingredient.upcase, :size => 7
  end

  #Concentration
  pdf.bounding_box([75, pdf.cursor - 2], :width => 195, :height => 20) do
    pdf.text @phytosanitary.concentration.upcase, :size => 7
  end

  #Duration and Temperature
  pdf.bounding_box([75, pdf.cursor - 6], :width => 195, :height => 18) do
    pdf.text @phytosanitary.duration_temperature.upcase, :size => 7
  end

  #Responsible
  pdf.bounding_box([75, pdf.cursor - 4], :width => 195, :height => 32) do
    pdf.text @phytosanitary.responsible.upcase, :size => 7
  end

  #Number
  pdf.bounding_box([30, pdf.cursor - 48], :width => 65, :height => 10) do
    pdf.text @phytosanitary.number.to_s, :size => 10, :align => :left, :style => :bold
  end
end
