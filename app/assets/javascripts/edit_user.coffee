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
