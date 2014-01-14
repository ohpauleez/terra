
local fib = terralib.defmulti(tonumber)
terralib.defmethod(fib, 0, function() return 0 end)
terralib.defmethod(fib, 1, function() return 1 end)
terralib.defmethod(fib, "default", function(n) return fib(n-1) + fib(n-2) end)

local test = require("test")

test.eq(55, fib(10))

local animals = terralib.defmulti(function(animal) return animal.kind end)
terralib.defmethod(animals, "cow", function() return "The cow goes moo" end)

test.eq("The cow goes moo", animals({kind = "cow"}))
local status, err = pcall(animals, {kind = "fox"})
test.eq("src/terralib.lua:709: no dispatch for key: fox", err)

