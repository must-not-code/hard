$ ->
  if $('#brackets').length
    saveFn = (data) ->
      $.ajax
        url: gon.tournament_standings_path
        type: 'POST'
        data:
          json: JSON.stringify(data)

    edit_fn = (container, data, doneCb) ->
      input = $('<input type="text">')
      input.val(data.name)
      container.html(input)
      input.focus()
      input.blur ->
        doneCb
          flag: data.flag
          name: input.val()

    render_fn = (container, data, score) ->
      if data.flag
        container.append('<img src="/classes/'+data.flag+'.png"/> ')
      else
        container.append('')

      if $('#brackets').data('team')
        if data.name
          container.append(data.name)
        else
          container.append('')

      else
        if data.name
          container.append('<a href=/users/'+encodeURIComponent(data.name)+'>'+data.name+'</a>')
        else
          container.append('')

    upload_bracket = () ->
      $.ajax
        url: gon.tournament_standings_path
        type: 'GET'
        success: (standings) ->
          $('#brackets').bracket
            init: standings
            skipConsolationRound: gon.skip_consolation_round
            skipSecondaryFinal: gon.skip_secondary_final
            save: saveFn if gon.admin
            decorator:
              edit: edit_fn
              render: render_fn
          if $('.loserBracket').length
            $('.bracket').css({float: 'right'})

    upload_bracket()

    setInterval ->
      upload_bracket()
    , 60000

  $('#shuffle').click ->
    if confirm('Сгенерить сетку, о мой повелитель?')
      $.ajax
        type: 'POST'
        url: gon.tournament_shuffle_path
        success: ->
          location.reload()
