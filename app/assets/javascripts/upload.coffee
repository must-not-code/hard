$ ->
  Dropzone.options.dropzone =
    autoProcessQueue: false
    uploadMultiple: true
    parallelUploads: 20
    maxFiles: 20
    headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    previewTemplate: $.trim($('#previews').html())
    previewsContainer: '#previews'
    clickable: '#fileinput'
    acceptedFiles: 'image/*'
    dictInvalidFileType: 'Нужен файл формата png, gif, jpg или jpeg!'
    dictFileTooBig: 'Файл не должен быть больше 1мб!'
    init: ->
      myDropzone = this
      $('#preview').hide()

      myDropzone.on 'addedfile', (file) ->
        $('#current-img').hide()

        $('#cancel').onclick = ->
          myDropzone.removeAllFiles true

      $('input[type="submit"]').click (e) ->

        e.preventDefault()
        e.stopPropagation()

        if myDropzone.getQueuedFiles().length > 0
          myDropzone.processQueue()
        else
          myDropzone.uploadFiles([])

      @on "successmultiple", (files, response) ->
        if response.success
          window.location.replace(response.url)
        else
          $('#notice').html('<div class="alert alert-danger">' + response.error + '</div>')
          myDropzone.removeAllFiles true
          $('#fileinput').show()

      @on "error", (files, response) ->
        $('#notice').html('<div class="alert alert-danger">' + response + '</div>')
