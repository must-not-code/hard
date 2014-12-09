$ ->
  $('#update-user-data').on 'click', (event) ->
    event.preventDefault()
    $('#update-user-data').attr('disabled', true)
    $.ajax
      type: 'PUT'
      url: gon.user_path
      data:
        firstname: $('#firstname').val()
        lastname:  $('#lastname').val()
        skype:     $('#skype').val()
        vk:        $('#vk').val()
        fb:        $('#fb').val()
        site:      $('#site').val()
        twitch:    $('#twitch').val()
        twitter:   $('#twitter').val()
        tag:       $('#tag').val()
        email:     $('#email').val()
        about:     $('#about').val()
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
      maxFilesize: 1
      maxFiles: 1
      thumbnailWidth: 150
      thumbnailHeight: 150
      previewTemplate: previewTemplate
      previewsContainer: '#previews'
      autoQueue: false
      clickable: '#fileinput'
      acceptedFiles: 'image/*'
      headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      dictInvalidFileType: 'Нужен файл формата png, gif, jpg или jpeg!'
      dictFileTooBig: 'Файл не должен быть больше 1мб!'
      init: ->
        @on 'success', (file) ->
          window.location.replace(window.location.pathname.split('/avatar')[0])

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


  Dropzone.options.teamForm =
    autoProcessQueue: false
    uploadMultiple: true
    parallelUploads: 20
    maxFiles: 20
    headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    previewsContainer: '#preview'
    previewTemplate: $.trim($('#previews').html())
    clickable: '#fileinput'
    acceptedFiles: 'image/*'
    dictInvalidFileType: 'Нужен файл формата png, gif, jpg или jpeg!'
    dictFileTooBig: 'Файл не должен быть больше 1мб!'
    init: ->
      myDropzone = this

      myDropzone.on 'addedfile', (file) ->
        $('#current-logo').hide()

      $('input[type="submit"]').click (e) ->

        e.preventDefault()
        e.stopPropagation()

        if myDropzone.getQueuedFiles().length > 0
          myDropzone.processQueue()
        else
          myDropzone.uploadFiles([])

      @on "sendingmultiple", ->

      @on "successmultiple", (files, response) ->
        if response.success
          window.location.replace(window.location.pathname.split('/edit')[0])
        else
          $('#notice').html('<div class="alert alert-danger">' + response.error + '</div>')
          myDropzone.removeAllFiles true

      @on "error", (files, response) ->
        $('#notice').html('<div class="alert alert-danger">' + response + '</div>')
