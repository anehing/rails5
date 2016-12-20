App.book = App.cable.subscriptions.create "BookChannel",
  connected: ->
    alert 'connected'
    # Called when the subscription is ready for use on the server

  disconnected: ->
    alert 'disconnected'
    # Called when the subscription has been terminated by the server

  received: ->
    # $('#book').append data['message']
    alert 'received'
    # Called when there's incoming data on the websocket for this channel

  publish: (message) ->
    @perform 'publish', message: message

$(document).on 'keypress','[data-behavior~=book_publish]',(event) ->
  if event.keyCode is 13
    App.book.publish event.target.value
    event.target.value = ''
    event.preventDefault()
