$ ->
  $('#update-user-data').on 'click', (event) ->
    event.preventDefault()
    $('#upload-avatar, #update-user-data').attr('disabled', true)
    $.ajax
      type: 'PUT'
      url: gon.user_path
      data:
        tag: $('#tag').val()
        skype: $('#skype').val()
        email: $('#email').val()
        about: $('#about').val()
      success: (response) ->
        if response.success
          window.location.replace(gon.user_path)
        else
          warning(response.errors)
          $('#update-user-data').removeAttr('disabled')

  $('#upload').bind 'change', ->
    file = $('input[type="file"]').val()
    exts = ['gif','png','jpg','jpeg']
    file_error_text = 'Файл должен быть не больше 200Kб и формата: gif, png, jpg, jpeg.'
    if file
      get_ext = file.split('.').reverse()
      if parseInt(this.files[0].size) > 204800
        $('#alert-placeholder').show()
        $('#upload-avatar').hide()
        warning(file_error_text)
      else
        if $.inArray(get_ext[0].toLowerCase(), exts) > -1
          $('#upload-avatar').show()
          $('#alert-placeholder').hide()
        else
          $('#alert-placeholder').show()
          $('#upload-avatar').hide()
          warning(file_error_text)

  $('#upload-avatar').click ->
    $('#avatar').submit()
    $('#upload-avatar, #update-user-data').attr('disabled', true)
