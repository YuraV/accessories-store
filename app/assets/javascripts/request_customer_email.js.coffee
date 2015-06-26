class @.RequestCustomerEmail
  constructor: (options)->
    @options = $.extend {}, {
      doNotShowAgain: ".do-not-show-again",
      form: "#new_customer",

    }, options
    do @createMessage


    $(document).on "click", "#{@options.doNotShowAgain}", (e) ->
        e.preventDefault()
        $.cookie("do_not_show_email_popup", true, { expires: @createDate(24) })
        $.facebox.close()

    $(document).on "submit", "#{@options.form}", (e) ->
        e.preventDefault()
        $.ajax
          url: $(@).attr("action")
          method: "POST"
          data: $(@).serialize()
          dataType: "JSON"
        .success (data)->
          $.facebox.close()
        .error (data) ->
          $("#flasher-box").html($.tmpl('__flasher__', type: "alert", message: "e-mail #{data.responseJSON.errors.email}"))

    @loadFacebox()

  createMessage: ->
    $.template('__flasher__', '''
      <p class=${type}>{{html message}}</p>
    ''')

  createDate: (houres)->
    date = new Date()
    date.setTime(date.getDate() + (houres * 60 * 60 * 1000))

  loadFacebox: ->
    $.facebox(ajax: @options.url)