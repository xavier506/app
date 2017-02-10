
# EVERGREEN
if @bill_of_lading.liner == 'Evergreen'
  bg_image = "#{Rails.root}/app/assets/images/pdf/evergreen.png"
  pdf.image bg_image, :scale => 0.90
  pdf.move_up 666

  indent 15 do

    #Exporter
    pdf.bounding_box([0, pdf.cursor + 0], :width => 290, :height => 50) do
      pdf.text @bill_of_lading.exporter.upcase, :size => 7
    end

    # Document Number
    pdf.bounding_box([295, pdf.cursor + 50], :width => 230, :height => 12) do
      pdf.text @bill_of_lading.document_number.upcase, :size => 8
    end

    #Consignee
    pdf.bounding_box([0, pdf.cursor - 54], :width => 290, :height => 50) do
      pdf.text @bill_of_lading.receiver.upcase, :size => 7
    end

    #Export References
    pdf.bounding_box([295, pdf.cursor + 94], :width => 230, :height => 35) do
      pdf.text @bill_of_lading.export_references.upcase, :size => 7
    end

    #Forwarding Agent References
    pdf.bounding_box([295, pdf.cursor - 10], :width => 230, :height => 50) do
      pdf.text @bill_of_lading.forwarding_agent_references.upcase, :size => 7
    end

    #Notify
    pdf.bounding_box([0, pdf.cursor - 5], :width => 290, :height => 65) do
      pdf.text @bill_of_lading.notify.upcase, :size => 7
    end

    #Place of Origin
    pdf.bounding_box([295, pdf.cursor + 65 ], :width => 230, :height => 12) do
      pdf.text @bill_of_lading.place_of_origin.upcase, :size => 7
    end

    #Also Notify
    pdf.bounding_box([295, pdf.cursor - 10], :width => 230, :height => 65) do
      pdf.text @bill_of_lading.also_notify.upcase, :size => 7
    end

    #Precarrige
    pdf.bounding_box([0, pdf.cursor + 8], :width => 155, :height => 12) do
      pdf.text @bill_of_lading.precarriage.upcase, :size => 7
    end

    #Place of Reciept
    pdf.bounding_box([160, pdf.cursor + 12], :width => 130, :height => 12) do
      pdf.text @bill_of_lading.place_of_reciept.upcase, :size => 7
    end

    #Ocean Vessel
    pdf.bounding_box([0, pdf.cursor - 8], :width => 155, :height => 12) do
      pdf.text @bill_of_lading.ocean_vessel.upcase, :size => 7
    end

    #Loading Port
    pdf.bounding_box([160, pdf.cursor + 11], :width => 130, :height => 12) do
      pdf.text @bill_of_lading.loading_port.upcase, :size => 7
    end

    #Discharge Port
    pdf.bounding_box([0, pdf.cursor - 9], :width => 155, :height => 12) do
      pdf.text @bill_of_lading.discharge_port.upcase, :size => 7
    end

    #Place of Delivery
    pdf.bounding_box([160, pdf.cursor + 11], :width => 130, :height => 12) do
      pdf.text @bill_of_lading.place_of_delivery.upcase, :size => 7
    end

    #Place of Delivery
    pdf.bounding_box([295, pdf.cursor + 30], :width => 230, :height => 30) do
      pdf.text @bill_of_lading.instructions.upcase, :size => 7
    end

#      pdf.transparent(0.5) { pdf.stroke_bounds }

    #
    #
    # @bill_of_lading.description.upcase
    # @bill_of_lading.freight_charges.upcase
    # @bill_of_lading.revenue_tons.upcase
    # @bill_of_lading.rate.upcase
    # @bill_of_lading.prepaid.upcase
    # @bill_of_lading.collect.upcase
    # @bill_of_lading.bl_number.upcase
    # @bill_of_lading.original_number.upcase
    # @bill_of_lading.prepaid_at.upcase
    # @bill_of_lading.collect_at.upcase
    # @bill_of_lading.place_of_issue.upcase
    # @bill_of_lading.issue_date.upcase
    # @bill_of_lading.exchange_rate_1.upcase
    # @bill_of_lading.exchange_rate_2.upcase
    # @bill_of_lading.service_type.upcase
    # @bill_of_lading.laden_on_board.upcase
    # @bill_of_lading.rider_pages.upcase
    # @bill_of_lading.total_cmb.upcase
    # @bill_of_lading.verfified_gross_mass.upcase

  end
else
  pdf.text 'No Template Available for Selected Liner', :size => 24, :align => :center
end
