bg_image = "#{Rails.root}/app/assets/images/pdf/blank_phyto.png"
pdf.image bg_image, :scale => 0.2181
pdf.move_up 645
#  pdf.transparent(0.5) { pdf.stroke_bounds }
#Number
pdf.bounding_box([472, pdf.cursor - 26], :width => 65, :height => 10) do
  pdf.text @phytosanitary.number.to_s, :size => 10, :align => :left, :style => :bold
end

# Exporter
pdf.bounding_box([25, pdf.cursor - 40], :width => 253, :height => 22) do
  pdf.text @phytosanitary.exporter.upcase, :size => 7
  pdf.transparent(0.5) { pdf.stroke_bounds }
end

#Consignee
pdf.bounding_box([279, pdf.cursor + 21], :width => 250, :height => 21) do
  pdf.text @phytosanitary.receiver.upcase, :size => 7
end

#Organization
pdf.bounding_box([28, pdf.cursor - 17], :width => 152, :height => 28) do
  pdf.text @phytosanitary.organization.upcase, :size => 7
end

#Place of Origin
pdf.bounding_box([182, pdf.cursor + 30], :width => 95, :height => 30) do
  pdf.text @phytosanitary.place_of_origin.upcase, :size => 7
end

#Point of Entry
pdf.bounding_box([279, pdf.cursor + 30], :width => 95, :height => 30) do
  pdf.text @phytosanitary.point_of_entry.upcase, :size => 7
end

#Mode & Point of Exit
exitext = @phytosanitary.mode.upcase + ' ' + @phytosanitary.point_of_exit.upcase
pdf.bounding_box([375, pdf.cursor + 15], :width => 170, :height => 15) do
  pdf.text exitext, :size => 7
end

#Description
pdf.bounding_box([28, pdf.cursor - 16], :width => 500, :height => 77) do
  pdf.text @phytosanitary.description.upcase, :size => 7
end

#Additional Declaration
pdf.bounding_box([28, pdf.cursor - 85], :width => 500, :height => 35) do
  pdf.text @phytosanitary.additional_declaration.upcase, :size => 7
end

#Place of Issue
pdf.bounding_box([335, pdf.cursor - 10], :width => 190, :height => 10) do
  pdf.text @phytosanitary.place_of_issue.upcase, :size => 7
end

#Treatment Date
pdf.bounding_box([100, pdf.cursor - 5], :width => 190, :height => 20) do
  pdf.text @phytosanitary.treatment_date.to_s, :size => 7
end

#Issue Date
pdf.bounding_box([325, pdf.cursor + 15], :width => 175, :height => 15) do
  pdf.text @phytosanitary.issue_date.to_s, :size => 7
end

#Treatment
pdf.bounding_box([102, pdf.cursor - 4], :width => 190, :height => 18) do
  pdf.text @phytosanitary.treatment.upcase, :size => 7
end

#Inspector
pdf.bounding_box([292, pdf.cursor - 4], :width => 104, :height => 80) do
  pdf.text @phytosanitary.inspector.upcase, :size => 7
end

#Active Ingredient
pdf.bounding_box([102, pdf.cursor + 80], :width => 190, :height => 18) do
  pdf.text @phytosanitary.active_ingredient.upcase, :size => 7
end

#Concentration
pdf.bounding_box([102, pdf.cursor - 4], :width => 190, :height => 18) do
  pdf.text @phytosanitary.concentration.upcase, :size => 7
end

#Duration and Temperature
pdf.bounding_box([102, pdf.cursor - 4], :width => 190, :height => 18) do
  pdf.text @phytosanitary.duration_temperature.upcase, :size => 7
end

#Responsible
pdf.bounding_box([102, pdf.cursor - 4], :width => 190, :height => 18) do
  pdf.text @phytosanitary.responsible.upcase, :size => 7
end

#Number
pdf.bounding_box([50, pdf.cursor - 103], :width => 65, :height => 10) do
  pdf.text @phytosanitary.number.to_s, :size => 10, :align => :left, :style => :bold
end
