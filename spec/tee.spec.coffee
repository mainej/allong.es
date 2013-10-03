{tee, variadic} = require('../lib/allong.es').allong.es

describe "tee", ->
  decoration = (n) -> n + 1
  original = (n) -> n * 2
  eavesDrop = (fn) ->
    calls = []
    results = []
    logger = variadic (args) ->
      calls.push(args)
      result = fn.apply(this, args)
      results.push(result)
      result
    logger.calls = calls
    logger.results = results
    logger

  it "calls the decorating function with the result of the original function", ->
    decoration = eavesDrop(decoration)
    tee(decoration)(original)(5)
    expect(decoration.calls[0]).toEqual([10])

  it "does something in the decorating function", ->
    decoration = eavesDrop(decoration)
    tee(decoration)(original)(5)
    expect(decoration.results[0]).toEqual(11)

  it "returns the result of the original function", ->
    expect(tee(decoration)(original)(5)).toEqual(10)
