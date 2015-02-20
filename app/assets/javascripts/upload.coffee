$ ->
  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader
      reader.onload = (e) ->
        $('.hard-table img').attr('src', e.target.result)
      reader.readAsDataURL input.files[0]

  $('input[type=file]').change ->
    readURL this
