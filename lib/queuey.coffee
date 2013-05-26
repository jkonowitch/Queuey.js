class Queuey
  constructor: ->
    @stack = []

  push: (data) ->
    @stack.push data
    @run()

  run: ->
    @worker(@stack.shift()) while @stack.length > 0 and @running

  start: ->
    @running = true
    @run()

  stop: ->
    @running = false

  worker: ->
    throw "Worker not implemented"