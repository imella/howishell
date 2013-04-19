$ ->
  $('#meeting-next').on 'click', ->
    $('#meeting').hide()
    $('#send-to-the-moon').show()

  $('#send-to-the-moon-next').on 'click', ->
    $('#send-to-the-moon').hide()
    $('#moon').show()

  $('#moon-next').on 'click', ->
    $('#moon').hide()
    $('#meeting').show()