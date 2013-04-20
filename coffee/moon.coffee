$ ->
  renderMoonMap = ->
    moonMap = [0..7].map (i)->
                [0..8].map (j)->
                  i: i
                  j: j
                  id: i*j
                  area: HIS.state.moon.cells[i*j]
    $('#moon-map').html(Handlebars.templates['moon.hb'](
      rows: moonMap.map((cells, i)-> {cells: cells, rowNumber: i}),
      colNumber: [0..8]))
    $('.area').on 'click', ->
      i = $(@).data('i')
      j = $(@).data('j')
      area = HIS.state.moon.cells[i*j]
      $('#area-info').html(Handlebars.templates['area.hb'](
        i: i
        j: j
        area: area))
      $('#area-info').modal('show')
      $('.knob').hide()
      $('#area-info').on 'shown', ->
        $('.knob').knob(knobDefaults)
        $('.knob').show()
  renderMoonMap()