$ ->
  $.extend $.facebox.settings,
    loadingImage: '/assets/facebox/loading.gif',
    closeImage  : '/assets/facebox/closelabel.png'

  $(document).find("a[rel=facebox]").facebox()