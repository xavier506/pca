class CertificatesController < ApplicationController
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
    @certificate.save
    redirect_to @certificate.order
  end

  def update
    if @certificate.update(certificate_params)
      redirect_to order_certificate_path(@order, @certificate)
    else
      render 'edit'
    end
  end

  def destroy
    @certificate.destroy
    redirect_to order_path(@order)
  end
  private

  def certificate_params
    params.require(:certificate).permit(
      :shipper,
      :receiver,
      :farm,
      :country,
      :mode,
      :order_id,
      :notify,
      :discharge_port,
      :departure_port,
      :observations,
      :units,
      :unit_type,
      :volume,
      :gross_weight,
      :invoices,
      :description
    )
  end
end
