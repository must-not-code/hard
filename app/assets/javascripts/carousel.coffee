$ ->
  resize = () ->
    resizer = () ->
      size = Math.max(Math.min($('.item.active h1').width() / 12, 50), 20)
      $('h1').css('font-size', size)

    resizer()
    $(window).on('resize.fittext orientationchange.fittext', resizer)

  resize()
