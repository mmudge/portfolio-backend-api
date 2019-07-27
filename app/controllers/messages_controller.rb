class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]
    before_action :authenticate_user!

  def index
    messages = Message.all
    render json: messages
  end


  def show
    render json: @message
  end


  def create
    # sender = User.find([:sender_id])
    sender = current_user
    receiver = User.find(message_params[:user_id])

    # message = Message.new(message_params)
    message = { subject: message_params[:subject], body: message_params[:body], user_id: receiver.id, sender_id: sender.id }

    m = receiver.messages.create(message)

    if m.save
      render json: m, status: :created
    else
      render json: m.errors, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end


    def message_params
      params.require(:message).permit(:subject, :body, :user_id, :sender_id)
    end
end
