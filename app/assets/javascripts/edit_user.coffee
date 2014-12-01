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

$ ->
  if $('#avatar_uploader').length
    previewNode = document.querySelector('#template')
    previewNode.id = ''
    previewTemplate = previewNode.parentNode.innerHTML
    previewNode.parentNode.removeChild previewNode
    myDropzone = new Dropzone(document.body,
      url: 'avatar'
      maxFilesize: 0.5
      maxFiles: 1
      thumbnailWidth: 150
      thumbnailHeight: 150
      previewTemplate: previewTemplate
      autoQueue: false
      previewsContainer: '#previews'
      clickable: '#fileinput'
      acceptedFiles: 'image/*'
      headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      dictInvalidFileType: 'Нужен файл формата png, gif, jpg или jpeg!'
      dictFileTooBig: 'Файл не должен быть больше 500кб!'
    )
    myDropzone.on 'addedfile', (file) ->
      file.previewElement.querySelector('#save').onclick = ->
        myDropzone.enqueueFile file

      document.querySelector('#save').onclick = ->
        myDropzone.enqueueFiles myDropzone.getFilesWithStatus(Dropzone.ADDED)

      document.querySelector('#cancel').onclick = ->
        myDropzone.removeAllFiles true

      myDropzone.on 'sending', (file) ->
        file.previewElement.querySelector('#save').setAttribute 'disabled', 'disabled'
