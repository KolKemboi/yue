-- Learn Lua: A Self-Contained Project File
-- Run this with: lua learn_lua.lua

-------------------------------
-- 1. Variables and Types
-------------------------------
local a = 42 -- number
local b = "hello" -- string
local c = true -- boolean
local d = nil -- nil
print("Types:", type(a), type(b), type(c), type(d))

-------------------------------
-- 2. Control Structures
-------------------------------
local x = 10
if x > 5 then
	print("x is greater than 5")
elseif x == 5 then
	print("x is 5")
else
	print("x is less than 5")
end

for i = 1, 3 do
	print("for loop:", i)
end

local i = 1
while i <= 3 do
	print("while loop:", i)
	i = i + 1
end

-------------------------------
-- 3. Functions
-------------------------------
function greet(name)
	return "Hello, " .. name
end
print(greet("Lua"))

-- anonymous functions
local double = function(n)
	return n * 2
end
print("Double 4:", double(4))

-------------------------------
-- 4. Tables (arrays, dictionaries, objects)
-------------------------------
local t = { 1, 2, 3, name = "Lua", version = 5.4 }
print("t[1]:", t[1])
print("name:", t.name)

for k, v in pairs(t) do
	print(k, v)
end

-------------------------------
-- 5. Metatables and OOP
-------------------------------
local mt = {
	__add = function(a, b)
		return { val = a.val + b.val }
	end,
}

local obj1 = { val = 10 }
local obj2 = { val = 20 }
setmetatable(obj1, mt)
setmetatable(obj2, mt)

local obj3 = obj1 + obj2
print("obj3.val:", obj3.val)

-------------------------------
-- 6. Coroutines (lightweight threads)
-------------------------------
function counter()
	for i = 1, 3 do
		coroutine.yield(i)
	end
end

local co = coroutine.create(counter)

print("Coroutine output:")
while coroutine.status(co) ~= "dead" do
	local ok, val = coroutine.resume(co)
	print(val)
end

-------------------------------
-- 7. File I/O
-------------------------------
-- Write to a file
local file = io.open("test.txt", "w")
file:write("Hello, file!\n")
file:close()

-- Read from a file
file = io.open("test.txt", "r")
local content = file:read("*a")
print("File content:", content)
file:close()

-------------------------------
-- 8. Modules and Require
-------------------------------
-- We'll simulate a module inline (normally you'd save this in its own file)
local M = {}

function M.say_hello()
	return "Hello from a module!"
end

print(M.say_hello())

-------------------------------
-- 9. Error Handling
-------------------------------
local ok, err = pcall(function()
	error("Something went wrong!")
end)
if not ok then
	print("Caught error:", err)
end

-------------------------------
-- 10. Standard Libraries
-------------------------------
print("Math:", math.sqrt(16))
print("String upper:", string.upper("lua"))
print("Table insert:")
local arr = { 1, 2 }
table.insert(arr, 3)
for _, v in ipairs(arr) do
	print(v)
end
