class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  
    def index
      @reservations = Reservation.all
      render json: @reservations
    end
  
    def show
      render json: @reservation
    end
  
    def new
      @reservation = Reservation.new
    end
  
    def create
      @reservation = Reservation.new(reservation_params)
  
      if @reservation.save
        render json: @reservation, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @reservation.update(reservation_params)
        render json: @reservation, status: :ok
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @reservation.destroy
      head :no_content
    end
    def price_per_day
      hostel = Hostel.find_by(id: params[:hostel_id]) # Change :property_id to :hostel_id
    
      if hostel
        render json: { price_per_day: hostel.price_per_day }
      else
        render json: { error: 'Hostel not found' }, status: :not_found
      end
    end
    
  
    private
  
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
  
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
  end
  