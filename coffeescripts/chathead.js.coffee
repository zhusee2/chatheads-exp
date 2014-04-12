window.Chathead ?= {}

class Chathead.ChatView
  constructor: (container) ->
    @container = $(container)
    return false if @container.length < 1

    @bindEvents()

  bindEvents: ->
    @container.on "click.chathead", (event) =>
      if @isCollapsed()
        @_collapsedViewClickHandler(event)
      else
        @_expandedViewClickHandler(event)

  isCollapsed: -> @container.hasClass("collapsed")
  isExpanded: -> @container.hasClass("expanded")

  collapse: ->
    @container.addClass("collapsed")
    @container.removeClass("expanded")
  close: -> @collapse()

  expand: ->
    @container.addClass("expanded")
    @container.removeClass("collapsed")

  # Event Handlers
  _collapsedViewClickHandler: (event) ->
    @expand()
    event.preventDefault()

  _expandedViewClickHandler: (event) ->
    @collapse()
    event.preventDefault()

chatview = new Chathead.ChatView("ul.ch-head-list")
