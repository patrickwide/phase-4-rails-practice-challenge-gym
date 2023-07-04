class GymsController < ApplicationController
  def show
    gym = Gym.find(params[:id])
    render json: gym
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Gym not found' }, status: :not_found
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    render body: nil, status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Gym not found' }, status: :not_found
  end
end
