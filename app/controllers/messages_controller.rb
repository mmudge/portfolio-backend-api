class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def index
    messages = Message.all
    render json: messages
  end

  def create
    puts 'message params', message_params
    message = Message.new(message_params)


    if message.save
      ContactMailer.with(email: message_params[:email], name: message_params[:name], body: message_params[:body]).contact_message.deliver_now
      render json: message, status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :name, :email)
  end
end
