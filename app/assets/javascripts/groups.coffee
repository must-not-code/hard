$ ->
  if $('#groups').length
    label = (team) ->
      '<img src="/classes/' + team.hero + '.png" width="20" height="20"/> <a href=/users/' + encodeURIComponent(team.name) + '>' + team.name + '</a>'

    save_json = (state) ->
      #alert(JSON.stringify(state))

    for key, value of gon.groups
      $("#group-#{key}").group
        init: value
        labeler: label
        save: save_json if gon.admin
