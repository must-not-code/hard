$ ->
  if $('#carousel').length
    $('.post-content').dotdotdot
      watch: 'window'
    $('.post-content a').attr('target', 'blank')
