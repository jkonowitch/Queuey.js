class Queuey
  constructor: ->
    @stack = []

  push: (data) ->
    @stack.push data
    @run()

  run: ->
    if @running
      for elt in @stack[..]
        @worker(elt)
        @stack.splice(@stack.indexOf(elt), 1)

  start: ->
    @running = true
    @run()

  stop: ->
    @running = false

  worker: ->
    throw "Worker not implemented"