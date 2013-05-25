queue = undefined

describe "queue", ->
  element = { foo: "bar" }
  anotherElement = { herp: "derp" }

  beforeEach ->
    queue = new Queue
    queue.worker = jasmine.createSpy("worker")

  it "adds data to the stack", ->
    queue.push(element)
    expect(queue.stack).toEqual [element]

  it "works and clears the stack when run", ->
    queue.push(element)
    queue.push(anotherElement)
    queue.start()

    expect(queue.worker).toHaveBeenCalledWith(element)
    expect(queue.worker).toHaveBeenCalledWith(anotherElement)
    expect(queue.stack.length).toEqual(0)

  it "runs and clears newly added elements when running, does not when stopped", ->
    queue.start()

    queue.push(element)
    expect(queue.worker).toHaveBeenCalledWith(element)

    queue.stop()

    queue.push(anotherElement)
    expect(queue.worker).not.toHaveBeenCalledWith(anotherElement)
    expect(queue.stack.length).toEqual(1)