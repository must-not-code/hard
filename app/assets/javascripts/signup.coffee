$ ->
  $('#submit-signup').on 'click', (event) ->
    event.preventDefault()
    $('#submit-signup').attr('disabled', true)
    $.ajax
      type: 'POST'
      url: gon.users_path
      data:
        username: $('#username').val()
        email: $('#email').val()
        password: $('#password').val()
        password_confirmation: $('#password_confirmation').val()
      success: (response) ->
        if response.success
          window.location.replace(gon.root_path)
        else
          warning(response.errors)
          $('#submit-signup').removeAttr('disabled')
