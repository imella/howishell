$ ->
  renderMoonStats = ->
    state = HIS.resourceStatus()
    context = {resources: HIS.resourceStatus(), state: HIS.state}
    $("#area-stats").html(Handlebars.templates['globalStats.hb'](context))
  renderMoonMap = ->
    moonMap = [0..7].map (i)->
                [0..8].map (j)->
                  i: i
                  j: j
                  id: i*j
                  area: HIS.state.moon.cells[i*j]
    $('#moon-areas').html(Handlebars.templates['moon.hb'](
      rows: moonMap.map((cells, i)-> {cells: cells, rowNumber: i}),
      colNumber: [0..8]))

    renderMoonStats()

    $('.area').on 'click', ->
      i = $(@).data('i')
      j = $(@).data('j')
      area = HIS.state.moon.cells[i*j]
      placeable = $.map(HIS.state.availableToPlace, (v)->v).filter((t)-> t.quantity > 0)
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
        $('.knob').knob(knobDefaults)
        $('.knob').show()
        $('#build-in-area').on 'click', ->
          console.log "Building"

        $('.building').on 'click', ->
          console.log "asdasd"
          $('.building').removeClass('selected')
          $(@).addClass('selected')
          $('#build-in-area').removeAttr('disabled');

    $('.area').hover(->
        i = $(@).data('i')
        j = $(@).data('j')
        area = HIS.state.moon.cells[i*j]
        $('#area-stats').html(Handlebars.templates['areaStats.hb'](
          i: i
          j: j
          area: area))
        $('.knob').hide()
        $('.knob').knob(knobDefaults)
        $('.knob').show()).mouseleave ->
          renderMoonStats()
  renderMoonMap()