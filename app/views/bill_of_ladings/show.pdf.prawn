
# EVERGREEN
if @bill_of_lading.liner == 'EVERGREEN'
  font "Courier-Bold"
  bg_image = "#{Rails.root}/app/assets/images/pdf/evergreen.png"
  pdf.image bg_image, :scale => 0.90
  pdf.move_up 666

  indent 15 do

    #Exporter
    pdf.bounding_box([0, pdf.cursor + 0], width: 190, height: 55) do
      pdf.text(@bill_of_lading.exporter.upcase, {size: 9})
    end

    # Document Number
    pdf.bounding_box([295, pdf.cursor + 55], :width => 230, :height => 12) do
      pdf.text @bill_of_lading.document_number.upcase, {size: 9}
    end

    #Consignee
    pdf.bounding_box([0, pdf.cursor - 54], :width => 190, :height => 50) do
      pdf.text @bill_of_lading.receiver.upcase, {size: 9}
    end

    #Export References
    pdf.bounding_box([295, pdf.cursor + 94], :width => 230, :height => 35) do
      pdf.text @bill_of_lading.export_references.upcase, {size: 9}
    end

    #Forwarding Agent References
    pdf.bounding_box([295, pdf.cursor - 10], :width => 230, :height => 50) do
      pdf.text @bill_of_lading.forwarding_agent_references.upcase, {size: 9}
    end

    #Notify
    pdf.bounding_box([0, pdf.cursor - 5], :width => 190, :height => 65) do
      pdf.text @bill_of_lading.notify.upcase, {size: 9}
    end

    #Place of Origin
    pdf.bounding_box([295, pdf.cursor + 65 ], :width => 230, :height => 12) do
      pdf.text @bill_of_lading.place_of_origin.upcase, {size: 9}
    end

    #Also Notify
    pdf.bounding_box([295, pdf.cursor - 10], :width => 230, :height => 65) do
      pdf.text @bill_of_lading.also_notify.upcase, {size: 9}
    end

    #Precarrige
    pdf.bounding_box([0, pdf.cursor + 8], :width => 155, :height => 12) do
      pdf.text @bill_of_lading.precarriage.upcase, {size: 9}
    end

    #Place of Reciept
    pdf.bounding_box([160, pdf.cursor + 12], :width => 130, :height => 12) do
      pdf.text @bill_of_lading.place_of_reciept.upcase, {size: 9}
    end

    #Ocean Vessel
    pdf.bounding_box([0, pdf.cursor - 8], :width => 155, :height => 12) do
      pdf.text @bill_of_lading.ocean_vessel.upcase, {size: 9}
    end

    #Loading Port
    pdf.bounding_box([160, pdf.cursor + 11], :width => 130, :height => 12) do
      pdf.text @bill_of_lading.loading_port.upcase, {size: 9}
    end

    #Discharge Port
    pdf.bounding_box([0, pdf.cursor - 9], :width => 155, :height => 12) do
      pdf.text @bill_of_lading.discharge_port.upcase, {size: 9}
    end

    #Place of Delivery
    pdf.bounding_box([160, pdf.cursor + 11], :width => 130, :height => 12) do
      pdf.text @bill_of_lading.place_of_delivery.upcase, {size: 9}
    end

    #Instructions
    pdf.bounding_box([295, pdf.cursor + 30], :width => 230, :height => 30) do
      pdf.text @bill_of_lading.instructions.upcase, {size: 9}
    end

    #Total Volume
    pdf.bounding_box([445, pdf.cursor - 26], :width => 230, :height => 30) do
      pdf.text @bill_of_lading.total_volume.to_s + " " + @bill_of_lading.order.volume_units, {size: 9}
    end

    #Total Weight
    pdf.bounding_box([445, pdf.cursor + 20], :width => 230, :height => 30) do
      pdf.text @bill_of_lading.total_weight.to_s + " " + @bill_of_lading.order.weight_units, {size: 9}
    end

    move_down 28
    #CONTAINERS
    table_containers = []
    @bill_of_lading.containers.each do |c|
      container_data = [c.container_number.upcase  + '/' + c.container_type.upcase  + '/' + c.carrier_seal.upcase  + '/', c.units.to_s.upcase + ' ' + c.unit_type.upcase, c.gross_weight.to_s.upcase  + ' ' + c.order.weight_units.upcase  + ' ' + c.volume.to_s.upcase  + ' ' + c.order.volume_units.upcase   + ' ' + c.description.upcase ]
      if table_containers.size < 10 then
        table_containers.push(container_data)
      end
    end

    pdf.bounding_box([0, pdf.cursor + 50], :width => 525, :height => 120) do
      if table_containers.size > 0
        table(
          table_containers,
          :column_widths => {0 => 180, 1 => 95, 2 => 250},
          :cell_style =>{size: 9, :border_width => 0, :padding => 1}
        )
      else
        pdf.text "No Containers", size: 9
      end
    end

    #BL Description
    pdf.bounding_box([180, pdf.cursor + 0], :width => 230, :height => 36) do
      pdf.text @bill_of_lading.description, {size: 9}
    end

    #Total Units
    pdf.bounding_box([180, pdf.cursor + 0], :width => 230, :height => 10) do
      pdf.text @bill_of_lading.total_units.to_s + " " + @bill_of_lading.unit_type, {size: 9}
    end

    #Number of Containers
    num_containers_in_words = @bill_of_lading.containers.size.to_words.upcase + '(' + @bill_of_lading.containers.size.to_s + ') CONTAINERS ONLY'
    pdf.bounding_box([110, pdf.cursor - 0], :width => 400, :height => 20) do
      pdf.text num_containers_in_words, {size: 9}
    end

    #Freight & Charges
    pdf.bounding_box([0, pdf.cursor - 0], :width => 114, :height => 97) do
      pdf.text @bill_of_lading.freight_charges.upcase, {size: 9}
    end

    #Revenue Tons
    pdf.bounding_box([116, pdf.cursor + 97], :width => 100, :height => 97) do
      pdf.text @bill_of_lading.revenue_tons.upcase, {size: 9}
    end

    #Rate
    pdf.bounding_box([217, pdf.cursor + 97], :width => 95, :height => 97) do
      pdf.text @bill_of_lading.rate.upcase, {size: 9}
    end

    #Prepaid
    pdf.bounding_box([311, pdf.cursor + 97], :width => 105, :height => 97) do
      pdf.text @bill_of_lading.prepaid.upcase, {size: 9}
    end

    #Collect
    pdf.bounding_box([416, pdf.cursor + 97], :width => 112, :height => 97) do
      pdf.text @bill_of_lading.collect.upcase, {size: 9}
    end

    #Document Number
    pdf.bounding_box([0, pdf.cursor - 8], :width => 114, :height => 28) do
      pdf.text 'EGLV', {size: 9}
      pdf.text @bill_of_lading.document_number.upcase, {size: 9}
    end

    #Original Number
    pdf.bounding_box([115, pdf.cursor + 28], :width => 194, :height => 12) do
      pdf.text @bill_of_lading.original_number.upcase, {size: 9}
    end

    #Prepaid At
    pdf.bounding_box([312, pdf.cursor + 12], :width => 102, :height => 12) do
      pdf.text @bill_of_lading.prepaid_at.upcase, {size: 7}
    end

    #Collect At
    pdf.bounding_box([416, pdf.cursor + 12], :width => 110, :height => 12) do
      pdf.text @bill_of_lading.collect_at.upcase, {size: 7}
    end

    #Place of Issue
    pdf.bounding_box([116, pdf.cursor - 6], :width => 194, :height => 12) do
      pdf.text @bill_of_lading.place_of_issue.upcase, {size: 9}
      #pdf.text @bill_of_lading.issue_date
    end

    #Exchange Rate 1
    pdf.bounding_box([312, pdf.cursor + 12], :width => 102, :height => 12) do
      pdf.text @bill_of_lading.exchange_rate_1.to_s, {size: 9}
    end

    #Exchange Rate 2
    pdf.bounding_box([416, pdf.cursor + 12], :width => 110, :height => 12) do
      pdf.text @bill_of_lading.exchange_rate_2.to_s, {size: 9}
    end

    #Service Type
    pdf.bounding_box([0, pdf.cursor - 5], :width => 114, :height => 20) do
      pdf.text @bill_of_lading.service_type.upcase, {size: 9}
    end

    #Laden on Board
    pdf.bounding_box([116, pdf.cursor + 20], :width => 410, :height => 20) do
      pdf.text @bill_of_lading.laden_on_board.upcase, {size: 9}
    end
  end

  if @bill_of_lading.containers.size > 10 then
    pdf.start_new_page
      font "Courier-Bold"
      bg_image = "#{Rails.root}/app/assets/images/pdf/evergreen-page-2.png"
      pdf.image bg_image, :scale => 0.54
      pdf.move_up 85
      move_down 55
      indent 15 do

        #Page 2 header
        pdf.bounding_box([0, pdf.cursor - 0], :width => 400, :height => 10) do
          pdf.text @bill_of_lading.ocean_vessel.upcase + ' B/L NO. EGLV' +  @bill_of_lading.document_number.upcase, {size: 9}
        end

        #Rider Pages
        pdf.bounding_box([500, pdf.cursor + 10], :width => 25, :height => 10) do
          pdf.text @bill_of_lading.rider_pages.to_s, {size: 9}
        end

    move_down 18
    #CONTAINERS
      table_containers = []

      @bill_of_lading.containers[10..-1].each do |c|
        container_data = [c.container_number.upcase  + '/' + c.container_type.upcase  + '/' + c.carrier_seal.upcase  + '/', c.units.to_s.upcase + ' ' + c.unit_type.upcase, c.gross_weight.to_s.upcase  + ' ' + c.order.weight_units.upcase  + ' ' + c.volume.to_s.upcase  + ' ' + c.order.volume_units.upcase   + ' ' + c.description.upcase ]
          table_containers.push(container_data)
      end

      pdf.bounding_box([0, pdf.cursor + 0], :width => 525, :height => 630) do
          table(
            table_containers,
            :column_widths => {0 => 180, 1 => 95, 2 => 250},
            :cell_style =>{size: 9, :border_width => 0, :padding => 1}
          )
      end
    end
  end

elsif @bill_of_lading.liner == 'COSCO'
  bg_image = "#{Rails.root}/app/assets/images/pdf/cosco.png"
  pdf.image bg_image, :scale => 0.232
  pdf.move_up 666

  indent 7 do
    #Exporter
    pdf.bounding_box([0, pdf.cursor + 0], :width => 295, :height => 58) do
      pdf.text @bill_of_lading.exporter.upcase, {size: 9}
    end

    # Booking Number (comes from order)
    pdf.bounding_box([300, pdf.cursor + 59], :width => 114, :height => 10) do
      pdf.text @bill_of_lading.order.booking_number.upcase, {size: 9}
    end

    # Document Number
    pdf.bounding_box([420, pdf.cursor + 10], :width => 114, :height => 10) do
      pdf.text @bill_of_lading.document_number.upcase, {size: 9}
    end

    #Export References
    pdf.bounding_box([300, pdf.cursor - 8], :width => 230, :height => 42) do
      pdf.text @bill_of_lading.export_references.upcase, {size: 9}
    end

    #Consignee
    pdf.bounding_box([0, pdf.cursor - 12], :width => 295, :height => 58) do
      pdf.text @bill_of_lading.receiver.upcase, {size: 9}
    end

    #Forwarding Agent References
    pdf.bounding_box([298, pdf.cursor + 56], :width => 234, :height => 30) do
      pdf.text @bill_of_lading.forwarding_agent_references.upcase, {size: 9}
    end

    #Place of Origin
    pdf.bounding_box([300, pdf.cursor - 10 ], :width => 234, :height => 14) do
      pdf.text @bill_of_lading.place_of_origin.upcase, {size: 9}
    end

    #Notify
    pdf.bounding_box([0, pdf.cursor - 13], :width => 295, :height => 52  ) do
      pdf.text @bill_of_lading.notify.upcase, {size: 9}
    end

    #Also Notify
    pdf.bounding_box([298, pdf.cursor + 54], :width => 234, :height => 77) do
      pdf.text @bill_of_lading.also_notify.upcase, {size: 9}
    end

    #Precarrige
    pdf.bounding_box([0, pdf.cursor + 12], :width => 165, :height => 12) do
      pdf.text @bill_of_lading.precarriage.upcase, {size: 9}
    end

    #Place of Reciept
    pdf.bounding_box([168, pdf.cursor + 12], :width => 126, :height => 12) do
      pdf.text @bill_of_lading.place_of_reciept.upcase, {size: 9}
    end

    #Ocean Vessel
    pdf.bounding_box([0, pdf.cursor - 10], :width => 165, :height => 12) do
      pdf.text @bill_of_lading.ocean_vessel.upcase, {size: 9}
    end

    #Loading Port
    pdf.bounding_box([168, pdf.cursor + 12], :width => 126, :height => 12) do
      pdf.text @bill_of_lading.loading_port.upcase, {size: 9}
    end

    #Service Contract #
    pdf.bounding_box([298, pdf.cursor + 11], :width => 98, :height => 12) do
      #pdf.text @bill_of_lading.loading_port.upcase, {size: 9}
    end

    #Commodity Code
    pdf.bounding_box([398, pdf.cursor + 12], :width => 130, :height => 12) do
      #pdf.text @bill_of_lading.loading_port.upcase, {size: 9}
    end

    #Discharge Port
    pdf.bounding_box([0, pdf.cursor - 9], :width => 165, :height => 12) do
      pdf.text @bill_of_lading.discharge_port.upcase, {size: 9}
    end

    #Place of Delivery
    pdf.bounding_box([167, pdf.cursor + 11], :width => 130, :height => 12) do
      pdf.text @bill_of_lading.place_of_delivery.upcase, {size: 9}
    end

    #Service Type
    pdf.bounding_box([299, pdf.cursor + 12], :width => 230, :height => 12) do
      pdf.text @bill_of_lading.service_type.upcase, {size: 9}
    end

    move_down 2

    pdf.bounding_box([0, pdf.cursor - 15], :width => 535, :height => 18) do
      pdf.text '"SHIPPER\'S LOAD & COUNT"', size: 8, :align => :center
      pdf.text '"SAID TO CONTAIN"', size: 8, :align => :center
    end

    pdf.bounding_box([0, pdf.cursor + 0], :width => 110, :height => 10) do
      pdf.text 'N/M', size: 8
    end

    pdf.bounding_box([110, pdf.cursor + 10], :width => 60, :height => 20) do
      pdf.text @bill_of_lading.total_units.to_s, {size: 8, :align => :right}
      pdf.text @bill_of_lading.unit_type.upcase, {size: 8, :align => :right}
    end

    pdf.bounding_box([174, pdf.cursor + 20], :width => 205, :height => 20) do
      pdf.text @bill_of_lading.description.upcase, {size: 8, :align => :center}
    end

    #Total Weight
    pdf.bounding_box([380, pdf.cursor + 20], :width => 75, :height => 10) do
      pdf.text @bill_of_lading.total_weight.to_s + " " + @bill_of_lading.order.weight_units, {size: 9}
    end

    #Total Volume
    pdf.bounding_box([460, pdf.cursor + 10], :width => 80, :height => 10) do
      pdf.text @bill_of_lading.total_volume.to_s + " " + @bill_of_lading.order.volume_units, {size: 9}
    end

    #Payment Terms
    pdf.bounding_box([0, pdf.cursor - 20], :width => 170, :height => 10) do
      if @bill_of_lading.payment_terms
        @terms_string = @bill_of_lading.order.mode.upcase + ' FREIGHT ' + @bill_of_lading.payment_terms.upcase
        pdf.text @terms_string , {size: 8}
      end
    end

    pdf.bounding_box([0, pdf.cursor + 0], :width => 170, :height => 10) do
      pdf.text 'ON CY-CY TERM', size: 8, :align => :left
    end

    pdf.bounding_box([0, pdf.cursor + 0], :width => 170, :height => 10) do
      pdf.text 'SHIPPER\'S LOAD,COUNT AND SEAL', size: 8, :align => :left
    end

    #CONTAINERS
    table_containers = []
    @bill_of_lading.containers.each do |c|
      container_data = [c.container_number.upcase  + '/' + c.container_type.upcase  + '/' + c.carrier_seal.upcase  + '/', c.units.to_s.upcase + ' ' + c.unit_type.upcase, c.gross_weight.to_s.upcase  + ' ' + c.order.weight_units.upcase  + ' ' + c.volume.to_s.upcase  + ' ' + c.order.volume_units.upcase   + ' ' + c.description.upcase ]
      if table_containers.size < 9 then
        table_containers.push(container_data)
      end
    end

    pdf.bounding_box([0, pdf.cursor - 0], :width => 535, :height => 90) do
      #pdf.transparent(0.5) { pdf.stroke_bounds }
      if table_containers.size > 0
        table(
          table_containers,
          :column_widths => {0 => 180, 1 => 95, 2 => 250},
          :cell_style =>{size: 8, :border_width => 0, :padding => 1}
        )
      else
        pdf.text "NO CONTAINERS", size: 8
      end

      if @bill_of_lading.containers.size > 9
        pdf.text "**  TO BE CONTINUED ON ATTACHED LIST  **", size: 8, :align => :center
      end
    end

    #Declared Cargo Value
    pdf.bounding_box([80, pdf.cursor - 1], :width => 90, :height => 11) do
      #pdf.text @bill_of_lading.declared_value.upcase, {size: 9}
    end

    #Description of Contents
    pdf.bounding_box([420, pdf.cursor + 10], :width => 110, :height => 11) do
      #pdf.text @bill_of_lading.loading_port.upcase, {size: 9}
    end

    #Number of Containers
    num_containers_in_words = 'SAY ' + @bill_of_lading.containers.size.to_words.upcase + '(' + @bill_of_lading.containers.size.to_s + ') CONTAINERS TOTAL'
    pdf.bounding_box([170, pdf.cursor - 5], :width => 350, :height => 10) do
      pdf.text num_containers_in_words, {size: 9}
    end

    #Freight & Charges
    pdf.bounding_box([0, pdf.cursor - 10], :width => 102, :height => 112) do
      pdf.text @bill_of_lading.freight_charges.upcase, {size: 9}
    end

    #Revenue Tons
    pdf.bounding_box([103, pdf.cursor + 112], :width => 41, :height => 112) do
      pdf.text @bill_of_lading.revenue_tons.upcase, {size: 9}
    end

    #Rate
    pdf.bounding_box([145, pdf.cursor + 112], :width => 47, :height => 112) do
      pdf.text @bill_of_lading.rate.upcase, {size: 9}
    end

    #Per
    pdf.bounding_box([192, pdf.cursor + 112], :width => 65, :height => 112) do
      #pdf.text @bill_of_lading.per.upcase, {size: 9}
    end

    #Amount
    pdf.bounding_box([260, pdf.cursor + 112], :width => 98, :height => 112) do
      #pdf.text @bill_of_lading.amount.upcase, {size: 9}
    end

    #Prepaid
    pdf.bounding_box([360, pdf.cursor + 112], :width => 20, :height => 112) do
      pdf.text @bill_of_lading.prepaid.upcase, {size: 9}
    end

    #Collect
    pdf.bounding_box([381, pdf.cursor + 112], :width => 20, :height => 112) do
      pdf.text @bill_of_lading.collect.upcase, {size: 9}
    end

    #Collect At
    pdf.bounding_box([402, pdf.cursor + 112], :width => 130, :height => 112) do
      pdf.text @bill_of_lading.collect_at.upcase, {size: 9}
    end

    #Date Laden on Board
    pdf.bounding_box([422, pdf.cursor + 0], :width => 113, :height => 10) do
      pdf.text @bill_of_lading.laden_on_board.upcase, {size: 9}
    end

    # pdf.transparent(0.5) { pdf.stroke_bounds }
    if @bill_of_lading.containers.size > 10 then
      pdf.start_new_page
        bg_image = "#{Rails.root}/app/assets/images/pdf/cosco-page-2.png"
        pdf.image bg_image, :scale => 0.70
        pdf.move_up 598

          #Vessel
          pdf.bounding_box([40, pdf.cursor - 0], :width => 100, :height => 10) do
            pdf.text @bill_of_lading.ocean_vessel.upcase, {size: 9}
          end

          #BL Number
          pdf.bounding_box([375, pdf.cursor + 10], :width => 100, :height => 10) do
            pdf.text @bill_of_lading.document_number.upcase, {size: 9}
          end

          move_down 15

      #CONTAINERS
        table_containers = []

        @bill_of_lading.containers[10..-1].each do |c|
          container_data = [c.container_number.upcase  + '/' + c.container_type.upcase  + '/' + c.carrier_seal.upcase  + '/', c.units.to_s.upcase + ' ' + c.unit_type.upcase, c.gross_weight.to_s.upcase  + ' ' + c.order.weight_units.upcase  + ' ' + c.volume.to_s.upcase  + ' ' + c.order.volume_units.upcase   + ' ' + c.description.upcase ]
            table_containers.push(container_data)
        end

      pdf.bounding_box([0, pdf.cursor + 0], :width => 525, :height => 630) do
          table(
            table_containers,
            :column_widths => {0 => 180, 1 => 95, 2 => 250},
            :cell_style =>{size: 9, :border_width => 0, :padding => 1}
          )
      end
    end
  end
elsif @bill_of_lading.liner == 'HAPAG-LLOYD'
  bg_image = "#{Rails.root}/app/assets/images/pdf/hapag.png"
  pdf.image bg_image, :scale => 0.54
  pdf.move_up 666
else
  pdf.text 'No Template Available for Selected Liner', :size => 24, :align => :center
end
