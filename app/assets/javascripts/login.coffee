$ ->
  $('#submit-login').on 'click', (event) ->
    event.preventDefault()
    $('#submit-login').attr('disabled', true)
    $.ajax
      type: 'POST'
      url: gon.login_path
      data:
        username: $('#username').val()
        password: $('#password').val()
        remember: $('#password').val()
      success: (response) ->
        if response.success
          window.location.replace(gon.root_path)
        else
          warning(response.errors)
          $('#submit-login').removeAttr('disabled')
