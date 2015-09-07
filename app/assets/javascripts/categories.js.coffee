Store.ns('Store.Categories')

class Store.Categories
  constructor: (options)->
    settings = $.extend {}, {
      filterForm: $("#new_filter"),
      filtersSelect: $("#filters"),
      syncFilters: $("#sync_filters"),
      categoryFilters: $("#category_filters")
    },options

    { @filterForm, @filtersSelect, @syncFilters, @categoryFilters } = settings

    @filterNewHandler()


  filterNewHandler: ->
    @filterForm.on "submit", (e)=>
      e.preventDefault()

      $.post @filterForm.attr('action'), @filterForm.serialize()
      .success (data)=>
        @categoryFilters.replaceWith(data).find("select").multiSelect()