tab1 = {key1="val1", key2="val2", "val3"}
for k,v in pairs(tab1) do
	print(k .. "-" ..v)
end

tab1.key1 = nil
for k,v in pairs(tab1) do
	print(k .. "-" ..v)
end
print("---")
tab2 = {key1="val1", "val2", key3="val3", "val4"}
for k,v in pairs(tab2) do
	print(k .. "-" ..v)
end

tab2.key3 = nil
for k,v in pairs(tab2) do
	print(k .. "-" ..v)
end
print("--")
print(type("hello lua"))  -- string
print(type(10.4*3))   -- number
print(type(print))   -- function
print(type(true))   -- boolean
print(type(nil))   -- nil
print(type(type(X)))   -- string
print(type(type(true)))   -- string
print(type(type(10.1)))   -- string
