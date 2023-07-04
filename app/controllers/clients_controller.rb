class ClientsController < ApplicationController
  def show
    client = Client.find(params[:id])
    render json: client
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Client not found' }, status: :not_found
  end

  def total_amount
    client = Client.find(params[:id])
    total = client.memberships.sum(:charge)
    render json: { total_amount: total }
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Client not found' }, status: :not_found
  end
end
