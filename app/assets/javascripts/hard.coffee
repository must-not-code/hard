$ ->
  $(document).on 'ajax:success', 'form', (xhr, data, response) ->
    if data.error
      $('#notice').html('<div class="alert alert-danger">' + data.error + '</div>')
    if data.url
      window.location.replace(data.url)
    if data.div
      $(data.div).load(data.load + ' ' + data.div)
      $(data.div + ' textarea').val('')
