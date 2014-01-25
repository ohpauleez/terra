
local a = {}

a.b = 2
a.c = 3
a.d = function(...) return ... end

local test = require("test")

test.eq('{["b"] = 2, ["c"] = 3, ["d"] = function}', terralib.dir(a))

