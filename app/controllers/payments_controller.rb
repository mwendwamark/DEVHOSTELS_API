class PaymentsController < ApplicationController

    before_action :set_payment, only: %i[ show edit update destroy ]

    #GET /payments
    def index
        payments = Payment.all
    end


    #GET /payments/1
    def show
    end


    #GET /payments/1/edit
    def edit
        authorize payment
    end
    

    #GET /payments/new
    def new
        payment = Payment.new
    end
    

    # Use callbacks to share common setup or constraints between actions.   
    def set_payment
        payment=current_user.payments.find(params[:id])
    end
    

    # Only allow a trusted parameter "white list" through.
    def payment_params
        params.require(:payment).permit!(:mode_of_payment, :reservation_id)
    end

end
