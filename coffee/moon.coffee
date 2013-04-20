moonMap =
  [1..8].map (i)->
    [1..9].map (j)->
      {
        name: i+""+j
      }
$ ->
  $('#moon-map').html(Handlebars.templates['moon.hb'](rows: moonMap))