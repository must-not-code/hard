$ ->
  $('#update-user-data').on 'click', (event) ->
    event.preventDefault()
    $('#update-user-data').attr('disabled', true)
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

Dropzone.options.avatar =
  maxFilesize: 1
  maxFiles: 1
  addRemoveLinks: true
  thumbnailWidth: 120
  thumbnailHeight: 120
