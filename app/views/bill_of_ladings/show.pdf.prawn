
# EVERGREEN
if @bill_of_lading.liner == 'EVERGREEN'
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

    #Instructions
    pdf.bounding_box([295, pdf.cursor + 30], :width => 230, :height => 30) do
      pdf.text @bill_of_lading.instructions.upcase, :size => 7
    end

    move_down 28
    #CONTAINERS
    table_containers = []
    @containers = @bill_of_lading.containers(@bill_of_lading.order.id)
    @containers.each do |c|
      container_data = [c.container_number,c.units,c.description,c.gross_weight]
      if table_containers.size < 15 then
        table_containers.push(container_data)
      end
    end

    pdf.bounding_box([0, pdf.cursor - 2], :width => 525, :height => 170) do
      table(
        table_containers,
        :column_widths => {0 => 115, 1 => 60, 2 => 240, 3 => 110},
        :cell_style =>{:size => 8, :border_width => 0, :padding => 1}
      )
    end

    #Number of Containers
    pdf.bounding_box([116, pdf.cursor - 5], :width => 400, :height => 20) do
      pdf.text @bill_of_lading.order.total_containers(@bill_of_lading.order_id).to_words.upcase, :size => 8
    end

    #Freight & Charges
    pdf.bounding_box([0, pdf.cursor - 6], :width => 114, :height => 97) do
      pdf.text @bill_of_lading.freight_charges.upcase, :size => 7
    end

    #Revenue Tons
    pdf.bounding_box([116, pdf.cursor + 97], :width => 100, :height => 97) do
      pdf.text @bill_of_lading.revenue_tons.upcase, :size => 7
    end

    #Rate
    pdf.bounding_box([217, pdf.cursor + 97], :width => 95, :height => 97) do
      pdf.text @bill_of_lading.rate.upcase, :size => 7
    end

    #Prepaid
    pdf.bounding_box([311, pdf.cursor + 97], :width => 105, :height => 97) do
      pdf.text @bill_of_lading.prepaid.upcase, :size => 7
    end

    #Collect
    pdf.bounding_box([416, pdf.cursor + 97], :width => 112, :height => 97) do
      pdf.text @bill_of_lading.collect.upcase, :size => 7
    end

    #Document Number
    pdf.bounding_box([0, pdf.cursor - 8], :width => 114, :height => 28) do
      pdf.text @bill_of_lading.document_number.upcase, :size => 7
    end

    #Original Number
    pdf.bounding_box([115, pdf.cursor + 28], :width => 194, :height => 12) do
      pdf.text @bill_of_lading.original_number.upcase, :size => 7
    end

    #Prepaid At
    pdf.bounding_box([312, pdf.cursor + 12], :width => 102, :height => 12) do
      pdf.text @bill_of_lading.prepaid_at.upcase, :size => 7
    end

    #Collect At
    pdf.bounding_box([416, pdf.cursor + 12], :width => 110, :height => 12) do
      pdf.text @bill_of_lading.collect_at.upcase, :size => 7
    end

    #Place of Issue
    pdf.bounding_box([116, pdf.cursor - 6], :width => 194, :height => 12) do
      pdf.text @bill_of_lading.place_of_issue.upcase, :size => 7
      #pdf.text @bill_of_lading.issue_date
    end

    #Exchange Rate 1
    pdf.bounding_box([312, pdf.cursor + 12], :width => 102, :height => 12) do
      pdf.text @bill_of_lading.exchange_rate_1.to_s, :size => 7
    end

    #Exchange Rate 2
    pdf.bounding_box([416, pdf.cursor + 12], :width => 110, :height => 12) do
      pdf.text @bill_of_lading.exchange_rate_2.to_s, :size => 7
    end

    #Service Type
    pdf.bounding_box([0, pdf.cursor - 5], :width => 114, :height => 20) do
      pdf.text @bill_of_lading.service_type.upcase, :size => 7
    end

    #Laden on Board
    pdf.bounding_box([116, pdf.cursor + 20], :width => 410, :height => 20) do
      pdf.text @bill_of_lading.laden_on_board.upcase, :size => 7
    end


    # @bill_of_lading.description.upcase
    # @bill_of_lading.rider_pages.upcase
    # @bill_of_lading.total_cmb.upcase
    # @bill_of_lading.verfified_gross_mass.upcase
    # pdf.transparent(0.5) { pdf.stroke_bounds }
  end

elsif @bill_of_lading.liner == 'COSCO'
  bg_image = "#{Rails.root}/app/assets/images/pdf/cosco.png"
  pdf.image bg_image, :scale => 0.232
  pdf.move_up 666

  indent 7 do
    #Exporter
    pdf.bounding_box([0, pdf.cursor + 0], :width => 295, :height => 58) do
      pdf.text @bill_of_lading.exporter.upcase, :size => 7
    end

    # Booking Number (comes from order)
    pdf.bounding_box([300, pdf.cursor + 59], :width => 114, :height => 10) do
      pdf.text @bill_of_lading.order.booking_number.upcase, :size => 8
    end

    # Document Number
    pdf.bounding_box([420, pdf.cursor + 10], :width => 114, :height => 10) do
      pdf.text @bill_of_lading.document_number.upcase, :size => 7
    end

    #Export References
    pdf.bounding_box([300, pdf.cursor - 8], :width => 230, :height => 42) do
      pdf.text @bill_of_lading.export_references.upcase, :size => 7
    end

    #Consignee
    pdf.bounding_box([0, pdf.cursor - 12], :width => 295, :height => 58) do
      pdf.text @bill_of_lading.receiver.upcase, :size => 7
    end

    #Forwarding Agent References
    pdf.bounding_box([298, pdf.cursor + 56], :width => 234, :height => 30) do
      pdf.text @bill_of_lading.forwarding_agent_references.upcase, :size => 7
    end

    #Place of Origin
    pdf.bounding_box([300, pdf.cursor - 10 ], :width => 234, :height => 14) do
      pdf.text @bill_of_lading.place_of_origin.upcase, :size => 7
    end

    #Notify
    pdf.bounding_box([0, pdf.cursor - 13], :width => 295, :height => 52  ) do
      pdf.text @bill_of_lading.notify.upcase, :size => 7
    end

    #Also Notify
    pdf.bounding_box([298, pdf.cursor + 54], :width => 234, :height => 77) do
      pdf.text @bill_of_lading.also_notify.upcase, :size => 7
    end

    #Precarrige
    pdf.bounding_box([0, pdf.cursor + 12], :width => 165, :height => 12) do
      pdf.text @bill_of_lading.precarriage.upcase, :size => 7
    end

    #Place of Reciept
    pdf.bounding_box([168, pdf.cursor + 12], :width => 126, :height => 12) do
      pdf.text @bill_of_lading.place_of_reciept.upcase, :size => 7
    end

    #Ocean Vessel
    pdf.bounding_box([0, pdf.cursor - 10], :width => 165, :height => 12) do
      pdf.text @bill_of_lading.ocean_vessel.upcase, :size => 7
    end

    #Loading Port
    pdf.bounding_box([168, pdf.cursor + 12], :width => 126, :height => 12) do
      pdf.text @bill_of_lading.loading_port.upcase, :size => 7
    end
  end
else
  pdf.text 'No Template Available for Selected Liner', :size => 24, :align => :center
end
