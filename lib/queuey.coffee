class Queuey
  constructor: ->
    @stack = []

  push: (data) ->
    @stack.push data
    @run()

  run: ->
    if @running
      @worker(@stack.shift()) while @stack.length > 0

  start: ->
    @running = true
    @run()

  stop: ->
    @running = false

  worker: ->
    throw "Worker not implemented"