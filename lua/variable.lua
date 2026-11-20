a = 1
func = function()
    b = "apple"
    local c = "Louis"
    print(a)
    print(b)
    print(c)
end
func()
print(a)
print(b)
print(c)
print("end")

a = {"hello", "lua", "python"}
print(a) 
h, k = 10, 2*10
print(h, k) 
x = 1
y =2
print(x, y)
x, y = y, x
print(x, y) 
print(a[1], a[2]) 
a[1], a[2] = a[2], a[1]
print(a[1], a[2]) 
d, c, e = a[1], a[2]
print(d, c, e) 
f, g, h = a[2], a[3]
print(f, g, h) 

if nil then
	print(true)
else
	print(false)
end
