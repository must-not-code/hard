@warning = (message, div) ->
  div = div || '#alert-placeholder'
  $(div).html('<div class=\'alert alert-danger\'>' + message + '</div>')

@success = (message, div) ->
  div = div || '#alert-placeholder'
  $(div).html('<div class=\'alert alert-success\'>' + message + '</div>')

$(document).on 'ajax:success', 'form', (xhr, data, response) ->
  if data.error
    $('#notice').html('<div class="alert alert-danger">' + data.error + '</div>')
