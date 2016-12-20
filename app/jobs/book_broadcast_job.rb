
class BookBroadcastJob < ApplicationJob
  queue_as :default

  def perform(book)
    # Do something later
    ActionCable.server.broadcast 'book_channel', message: render_message(book)
  end
  private
    def render_message(book)
      ApplicationController.renderer.render(partial: 'books/index', locals: {book: book})
    end
end
