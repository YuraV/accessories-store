class @.RequestCustomerEmail
  constructor: (options)->
    @options = $.extend {}, {

    }, options
    @loadFacebox()


  loadFacebox: ->
    $.facebox(ajax: @options.url)