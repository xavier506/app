class PhytosanitariesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :order
  load_and_authorize_resource :through => :order, shallow: true

  def new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @phytosanitary.save
    redirect_to @phytosanitary.order
  end

  def update
    if @phytosanitary.update(phytosanitary_params)
      redirect_to order_phytosanitary_path(@phytosanitary)
    else
      render 'edit'
    end
  end

  def destroy
    @phytosanitary.destroy
    redirect_to phytosanitaries_path
  end
  private

  def phytosanitary_params
    params.require(:phytosanitary).permit(
      :number,
      :exporter,
      :consignee,
      :organization,
      :place_of_origin,
      :point_of_entry,
      :point_of_exit,
      :mode,
      :description,
      :additional_declaration,
      :place_of_issue,
      :issue_date,
      :treatment_date,
      :treatment,
      :active_ingredient,
      :concentration,
      :duration_temperature,
      :responsible,
      :inspector,
      :order_id,
      :notification_id,
    )
  end
end
