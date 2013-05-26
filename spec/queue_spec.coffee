queue = undefined

describe "Queuey", ->
  element = { foo: "bar" }
  anotherElement = { herp: "derp" }
  aThirdElement = { shmee: "shmoo" }

  beforeEach ->
    queue = new Queuey
    queue.worker = jasmine.createSpy("worker")

  it "maintains a queue", ->
    queue.push(element)
    expect(queue.stack).toEqual [element]

  it "works and clears the queue when started, and doesn't run when stopped", ->
    queue.push(element)
    expect(queue.stack.length).toEqual(1)
    expect(queue.worker).not.toHaveBeenCalled()

    queue.start()
    expect(queue.worker).toHaveBeenCalledWith(element)
    expect(queue.stack.length).toEqual(0)

    queue.push(anotherElement)
    expect(queue.worker).toHaveBeenCalledWith(anotherElement)
    expect(queue.stack.length).toEqual(0)

    queue.stop()

    queue.push(aThirdElement)
    expect(queue.worker).not.toHaveBeenCalledWith(aThirdElement)
    expect(queue.stack).toEqual([aThirdElement])

    queue.start()
    expect(queue.worker).toHaveBeenCalledWith(aThirdElement)
    expect(queue.stack.length).toEqual(0)