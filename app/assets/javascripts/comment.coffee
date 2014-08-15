$ ->
  if $('#comments').length
    $('.post-content a').attr('target', 'blank')
    $('img').smoothZoom()

    $('#submit-comment').click ->
      $('#alert-placeholder').html('')
      $('#submit-comment').attr('disabled', true)
      $.ajax
        type: 'POST'
        url: gon.comments_path
        data:
          post: gon.post_id
          text: $('#comment-text').val()
        success: (response) ->
          if response.success
            $('#comments').load "#{gon.post_path} #comments", () ->
              $('#comment-text').val('')
          else
            warning(response.errors)
          $('#submit-comment').removeAttr('disabled')

    $('#comments').on 'click', '#delete-comment', () ->
      if confirm('Вы уверены, что хотите удалить этот комментарий?')
        $(this).attr('disabled', true)
        id = $(this).data('comment')
        $.ajax
          type: 'DELETE'
          url: gon.comments_path + '/' + id
          success: () ->
            $('#comments').load("#{gon.post_path} #comments")

     setInterval ->
       $('#comments').load("#{gon.post_path} #comments")
     , 60000
