# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
require 'pry'
class BookChannel < ApplicationCable::Channel
  def subscribed
    binding.pry
     stream_from "book_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def publish(data)

    # ActionCable.server.broadcast 'book_channel', message: data['message']
    Book.create! content: data['message']
  end

end
