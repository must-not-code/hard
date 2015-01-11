$ ->
  update_tournament_list = () ->
    $('<div/>').load gon.tournament_list_path, (page) ->
      $('#tournament-button').html($(page).find('#tournament-button'))
      $('#players-list').html($(page).find('#players-list'))

  $(document).on 'click', '#tournament-class a', (event) ->
    event.preventDefault()
    $('#tournament-signup').attr('disabled', true)
    kind = $(this).attr('id')
    $.ajax
      type: 'POST'
      url: gon.tournament_signup_path
      data: {'kind': kind}
      success: (response) ->
        if response.success
          success(response.msg)
        else
          warning(response.errors)
        update_tournament_list()

  $(document).on 'click', '#tournament-signout', ->
    if confirm('Вы уверены, что хотите отказаться от участия в турнире?')
      $('#tournament-signout').attr('disabled', true)
      $.ajax
        type: 'POST'
        url: gon.tournament_signout_path
        success: (response) ->
          if response.success
            success('Вы больше не записаны на этот турнир.')
          else
            warning(response.errors)
            $('#submit').removeAttr('disabled')
          update_tournament_list()

  $(document).on 'click', '#tournament-checkin', ->
    $('#tournament-checkin').attr('disabled', true)
    $.ajax
      type: 'POST'
      url: gon.tournament_checkin_path
      success: (response) ->
        if response.success
          success('Вы успешно подтвердили свое участие в турнире.')
        else
          warning(response.errors)
        update_tournament_list()

  if $('#results-list').length
    setInterval ->
      $('#results-list').load("#{$('#results').data('tournament')}} #results-list")
    , 60000
