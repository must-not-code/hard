$ ->
  if $('#carousel').length
    $('.post-content').dotdotdot
      watch: 'window'
    $('.post-content a').attr('target', 'blank')

#  if $('#comments').length
#     setInterval ->
#       $('#comments-list').load("#{$('#comments').data('post')} #comments-list")
#     , 60000
