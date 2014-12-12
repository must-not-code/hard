#= require active_admin/base
#= require active_admin/hstore_editor
#= require tinymce

$(document).ready ->
  tinyMCE.init
    toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | link image'
    selector: '.text textarea'
    height: 400
    convert_urls: false
    valid_elements: '*[*]'
    plugins: 'link, image, code, media, table'
