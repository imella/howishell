$ ->
  renderMoonStats = ->
    state = HIS.resourceStatus()
    context = {resources: HIS.resourceStatus(), state: HIS.state}
    $("#area-stats").html(Handlebars.templates['globalStats.hb'](context))
  renderMoonMap = ->
    console.log "Rendering Moon"
    #HIS.build()
    moonMap = [0..7].map (i)->
                [0..8].map (j)->
                  i: i
                  j: j
                  id: i*j
                  area: HIS.state.moon.cells[j*9+i]
    $('#moon-areas').html(Handlebars.templates['moon.hb'](
      rows: moonMap.map((cells, i)-> {cells: cells, rowNumber: i}),
      colNumber: [0..8]))

    renderMoonStats()

    $('.area').on 'click', ->
      i = $(@).data('i')
      j = $(@).data('j')
      pos = j*9+i
      area = HIS.state.moon.cells[pos]
      placeable = $.map(HIS.state.availableToPlace, (v)->v)
        .filter((t) -> t.id != 'scv')
        .map((p)-> {thing: HIS.data.things[p.id], quantity: p.quantity})
      buildings = HIS.buildables()
      $('#area-info').html(Handlebars.templates['area.hb'](
        buildings: buildings
        placeable: placeable
        i: i
        j: j
        area: area))
      $('#area-info').modal('show')
      $('.knob').hide()
      $('#area-info').on 'shown', ->
        $('checkbox').bootstrapSwitch()
        $('.knob').knob(knobDefaults)
        $('.knob').show()
        $('.building').on 'click', ->
          thing = HIS.data.things[$(@).data('id')]
          console.log ["build",thing, pos]
          HIS.build thing.id, pos
          $('#area-info').modal('hide')
          renderMoonMap()
        $('.placeable').on 'click', ->
          if $(@).data('quantity') > 0
            thing = HIS.data.things[$(@).data('id')]
            console.log ["place",thing, pos]
            HIS.placeFromAvailables thing.id, pos
            $('#area-info').modal('hide')
            renderMoonMap()

    $('.area').hover(->
        i = $(@).data('i')
        j = $(@).data('j')
        pos = j*9+i
        area = HIS.state.moon.cells[pos]
        $('#area-stats').html(Handlebars.templates['areaStats.hb'](
          i: i
          j: j
          area: area))
        $('.knob').hide()
        $('.knob').knob(knobDefaults)
        $('.knob').show()).mouseleave ->
          renderMoonStats()
  renderMoonMap()