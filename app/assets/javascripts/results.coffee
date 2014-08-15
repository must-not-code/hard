$ ->
  if $('#submit-result').length
    $('#submit-result').click ->
      $('#textarea-alert-placeholder').html('')
      $('#submit-result').attr('disabled', true)
      $.ajax
        type: 'POST'
        url: gon.results_path
        data:
          tournament: gon.tournament_id
          text: $('#result-text').val()
        success: (response) ->
          if response.success
            $('#results').load("#{gon.tournament_results_path} #results")
            $('#result-text').val('')
          else
            warning(response.errors, '#textarea-alert-placeholder')
          $('#submit-result').removeAttr('disabled')

    setInterval ->
      $('#results').load("#{gon.tournament_results_path} #results")
    , 60000
