# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  class Search
    init: ->
      @bindUIActions()

    # write all event binding code here.
    bindUIActions: ->

      $(document).on 'submit', '.searchForm', (e) ->
        e.preventDefault()
        $.ajax
          url: $(this).attr('action')
          data: $(this).serialize()
          dataType: 'json'
          method: 'POST'
          success: (response) ->
            console.log 'test json request: JSON response', response
            search.renderUsingUnderscore response
            return

    renderUsingMustache = (response) ->
      ghtml = Mustache.to_html($('#commentTemplate').html(), response)
      console.log 'test json request: generated html', ghtml
      $('.searchResults').html ghtml
      return

  window.search = new Search()
  search.init()