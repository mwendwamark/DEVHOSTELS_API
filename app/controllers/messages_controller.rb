class MessagesController < ApplicationController
    def index
      # Fetch all messages related to the current user (hostel owner or user)
      messages = Message.where(sender_id: @current_user.id).or(Message.where(receiver_id: @current_user.id))
      render json: messages
    end
  
    def create
      message = Message.new(message_params)
      message.sender = @current_user # Set the sender to the current user
      if message.save
        render json: message, status: :created
      else
        render json: { error: "Failed to send message" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def message_params
      params.permit(:content, :receiver_id)
    end
  end
  