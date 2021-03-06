class PhytosanitariesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :order
  load_and_authorize_resource :through => :order, shallow: true

  def new
  end

  def index
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page]

    @q = Phytosanitary.ransack q_param
    @phytosanitaries = @q.result.page(page).per(per_page)
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
      redirect_to order_phytosanitary_path(@order, @phytosanitary)
    else
      render 'edit'
    end
  end

  def destroy
    @phytosanitary.destroy
    redirect_to order_path(@order)
  end
  private

  def phytosanitary_params
    params.require(:phytosanitary).permit(
      :number,
      :exporter,
      :receiver,
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
      :notify,
    )
  end
end
