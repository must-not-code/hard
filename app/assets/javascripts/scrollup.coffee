$(window).scroll ->
  if $(this).scrollTop() > 100
    $('.scrollup').fadeIn()
  else
    $('.scrollup').fadeOut()

$(document).on 'click', '.scrollup', ->
  $('html, body').animate(scrollTop: 0 , 500)
  false
