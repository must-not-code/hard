$ ->
  if $('#groups').length
    label = (team) ->
      if team.format != ''
        flag = '<img src="/classes/' + team.format + '.png"/> '
      else
        flag = ''
      flag + '<a href=/users/' + encodeURIComponent(team.name) + '>' + team.name + '</a>'

    render_group = (char, data) ->
      $("#group-#{char}").group
        init: data
        labeler: label
        save: ((state) ->
          $.ajax
            url: gon.update_group_path
            type: 'POST'
            data:
              char: char
              json: JSON.stringify(state)) if gon.admin

    for key, value of gon.groups
      render_group(key, value)
