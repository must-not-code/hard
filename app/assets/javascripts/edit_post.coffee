$ ->
  if $('.post-editable').length
    $('#title').val(gon.post.title)
    $('#game').val(gon.post.game)

    $('#myForm').ajaxForm (msg) ->
      success(msg)
      $('#alert-placeholder').show()
      $('#save').attr('disabled', true)

    $('#upload').bind 'change', ->
      file = $('input[type="file"]').val()
      exts = ['png', 'jpeg', 'jpg', 'gif']
      file_error_text = 'Файл должен быть не больше 300Kб и формата: png, jpeg, jpg, gif'
      if file
        get_ext = file.split('.').reverse()
        if parseInt(this.files[0].size) > 307200
          $('#alert-placeholder').show()
          $('#save').hide()
          warning(file_error_text)
        else
          if $.inArray(get_ext[0].toLowerCase(), exts) > -1
            $('#save').show()
            $('#save').attr('disabled', false)
            $('#alert-placeholder').hide()
          else
            $('#alert-placeholder').show()
            $('#save').hide()
            warning(file_error_text)

    $('#submit').click ->
      $('#submit').attr('disabled', true)
      $.ajax
        type: 'POST'
        url: gon.post_save_path
        data:
          post: gon.post.id
          title: $('#title').val()
          game: $('#game').val().toLowerCase()
          text: tinyMCE.activeEditor.getContent().replace(/(\r\n|\n|\r)/gm,'')
        success: (response) ->
          if response.success
            window.location.replace(gon.post_path)
          else
            warning(response.errors)
            $('#submit').removeAttr('disabled')

    $('#approve').click ->
      if confirm('Are you sure?')
        $('#approve').attr('disabled', true)
        $.ajax
          type: 'POST'
          url: gon.post_approve_path
          success: ->
            window.location.replace(gon.post_path)
