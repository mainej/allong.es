{compose, variadic} = require('../lib/allong.es').allong.es

describe "compose", ->
  increment = (n) -> n + 1

  describe "of two functions", ->
    it "calls the first method with the result of the second method", ->
      double = (n) -> n * 2

      expect(compose(double, increment)(5)).toEqual(12)

    it "passes a second argument to the first method", ->
      collect = (a, b) -> [a, b]

      expect(compose(collect, increment)(1, 2)).toEqual([2, 2])

    it "passes a third argument to the first method", ->
      collect = (a, b, c) -> [a, b, c]

      expect(compose(collect, increment)(1, 2, 3)).toEqual([2, 2, 3])

    it "passes a fourth argument to the first method", ->
      collect = (a, b, c, d) -> [a, b, c, d]

      expect(compose(collect, increment)(1, 2, 3, 4)).toEqual([2, 2, 3, 4])

    it "passes variadic arguments to the first method", ->
      collect = variadic (args) -> args

      expect(compose(collect, increment)(1, 2, 3)).toEqual([2, 2, 3])

