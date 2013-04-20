moonMap =
  [1..8].map (i)->
    [1..9].map (j)->
      {
        name: i+""+j
      }
$ ->
  $('#moon-map').html(Handlebars.templates['moon.hb'](rows: moonMap))
  current = $('#screen-meeting')
  $("#next-btn").click ->
    $(".screen").each ->
      $(this).css "left", "150%"  if $(this).offset().left < 0

    current.animate
      left: "-150%"
    , 500
    if current.next().size() > 0
      current.next().animate
        left: "0"
      , 500
      current = current.next()
    else
      current.prevAll().last().animate
        left: "0"
      , 500
      current = current.prevAll().last()
  $('.area').on 'click', ->
    $('#area-info').html(Handlebars.templates['area.hb']())
    $('#area-info').modal('show')