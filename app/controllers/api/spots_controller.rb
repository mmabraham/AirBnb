class Api::SpotsController < ApplicationController
  before_action :require_logged_in!, except: [:show, :index]

  def show
    @spot = Spot.find(params[:id])
    if @spot
      render :show
    else
      render json: '', status: 404
    end
  end

  def index
    @spots = Spot.all
    @spots = Spot.in_bounds(@spots, params[:bounds])

    render :index
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.host_id = current_user.id
    if @spot.save
      render :show
    else
      @errors = @spot.errors
      render :errors, status: 422
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.nil?
      render json: {spot: 'Not found'}, status: 404
    elsif @spot.host_id != current_user.id
      render json: {spot: 'You can only update your own spots'},
        status: 401
    elsif @spot.update(spot_params)
      render :show
    else
      render json: @spot.errors, status: 422
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    if @spot && @spot.host_id == current_user.id
      render json: {}
    else
      render json: {spot: 'not found'}, status: 404
    end
  end

  private

  def spot_params
    params
      .require(:spot)
      .permit(:type, :title, :description, :capacity, :price, :lat, :lng)
  end
end
