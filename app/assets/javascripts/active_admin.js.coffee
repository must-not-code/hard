#= require active_admin/base
#= require active_admin/hstore_editor
#= require tinymce

$(document).ready ->
  tinyMCE.init
    toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | link image'
    selector: 'textarea'
    height: 400
    convert_urls: false
    valid_elements: '*[*]'
    plugins: 'advlist, autolink, lists, link, image, charmap, print, searchreplace, code, media, table, contextmenu, paste'
