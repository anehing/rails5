require 'rubygems'
require 'websocket/driver'
require 'eventmachine'

module Connection
  def initialize
    @driver = WebSocket::Driver.server(self)

    @driver.on :connect, -> (event) do
      if WebSocket::Driver.websocket?(@driver.env)
        @driver.start
      else
        # handle other HTTP requests
      end
    end

    @driver.on :message, -> (e) { @driver.text(e.data) }
    @driver.on :close,   -> (e) { close_connection_after_writing }
  end

  def receive_data(data)
    @driver.parse(data)
  end

  def write(data)
    send_data(data)
  end
end

EM.run {
  EM.start_server('127.0.0.1', 4180, Connection)
}

