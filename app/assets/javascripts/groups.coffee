$ ->
  if $('#groups').length
    groupData = {
      teams: [
        {id: 10, name: "YoDa", faction: "t" },
        {id: 11, name: "First", faction: "p" },
        {id: 12, name: "MC", faction: "p" },
        {id: 13, name: "Ret", faction: "z" },
        {id: 14, name: "Kas", faction: "t" },
        {id: 15, name: "XIorD", faction: "z" }
      ],
      matches: [
        { "id": 0,  "round": 1, "a": { "team": 0, "score": 1 }, "b": { "team": 1, "score": 2 } },
        { "id": 1,  "round": 1, "a": { "team": 0, "score": 2 }, "b": { "team": 2, "score": 1 } },
        { "id": 2,  "round": 1, "a": { "team": 1, "score": 2 }, "b": { "team": 2, "score": 1 } },
        { "id": 3,  "round": 2, "a": { "team": 0, "score": 2 }, "b": { "team": 3, "score": 0 } },
        { "id": 4,  "round": 2, "a": { "team": 1, "score": 0 }, "b": { "team": 3, "score": 2 } },
        { "id": 5,  "round": 2, "a": { "team": 2, "score": 0 }, "b": { "team": 3, "score": 2 } },
        { "id": 6,  "round": 3, "a": { "team": 0, "score": 2 }, "b": { "team": 4, "score": 1 } },
        { "id": 7,  "round": 3, "a": { "team": 1, "score": 2 }, "b": { "team": 4, "score": 0 } },
        { "id": 8,  "round": 3, "a": { "team": 2, "score": 2 }, "b": { "team": 4, "score": 0 } },
        { "id": 9,  "round": 4, "a": { "team": 3, "score": 2 }, "b": { "team": 4, "score": 1 } },
        { "id": 10, "round": 4, "a": { "team": 0, "score": 2 }, "b": { "team": 5, "score": 0 } },
        { "id": 11, "round": 4, "a": { "team": 1, "score": 2 }, "b": { "team": 5, "score": 1 } },
        { "id": 12, "round": 5, "a": { "team": 2, "score": 2 }, "b": { "team": 5, "score": 1 } },
        { "id": 13, "round": 5, "a": { "team": 3, "score": 2 }, "b": { "team": 5, "score": 0 } },
        { "id": 14, "round": 5, "a": { "team": 4, "score": 2 }, "b": { "team": 5, "score": 1 } }
      ]
    }

    faction = (faction) ->
      colors =
        t: "blue"
        z: "purple"
        p: "goldenrod"

      "<span style=\"padding: 2px; color: white;" + "display: inline-block; text-align: center;" + "font-size: 10px; width: 12px; margin: 0 3px;" + "background-color: " + colors[faction] + "\">" + faction + "</span>"

    customLabeler = (team) ->
      faction(team.faction) + " " + team.name

    $ ->
      $("#groups").group
        init: groupData
        labeler: customLabeler
