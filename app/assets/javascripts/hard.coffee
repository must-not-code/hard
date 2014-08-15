@warning = (message, div) ->
  div = div || '#alert-placeholder'
  $(div).html('<div class=\'alert alert-danger\'>' + message + '</div>')

@success = (message, div) ->
  div = div || '#alert-placeholder'
  $(div).html('<div class=\'alert alert-success\'>' + message + '</div>')
