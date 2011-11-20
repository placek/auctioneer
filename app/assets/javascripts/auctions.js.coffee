$ ->
  $('.button a').button()
  $('.big_button a').button()
  $('input[type="submit"]').button()
  $('textarea').tinymce({
     mode : 'textareas',
     theme : 'advanced',
     plugins : 'pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template',
     theme_advanced_buttons1 : 'undo,redo,|,cut,copy,paste,|,bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,|,bullist,numlist,|,outdent,indent,|,link,unlink,anchor,image,cleanup,code,|,fullscreen,help',
     theme_advanced_buttons2 : '',
     theme_advanced_buttons3 : '',
     theme_advanced_buttons4 : ''
  })
  return true
