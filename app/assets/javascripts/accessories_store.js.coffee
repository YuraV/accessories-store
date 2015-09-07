(->
  scope = @
  scope.Store = {
    namespace: ->
      o = d = null
      $.each arguments, (i, v) ->
        d = v.split('.')
        o = scope[d[0]] = scope[d[0]] || {}
        $.each d.slice(1), (i, v2) ->
          o = o[v2] = o[v2] || {}
  }
  scope.Store.ns = scope.Store.namespace
)()

Store.trigger = (eventType, extraParameters)->
  $(document).trigger(eventType, extraParameters)

Store.bind = (eventType, handler)->
  $(document).bind(eventType, handler)
