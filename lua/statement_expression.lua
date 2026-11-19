-- 8+2 -- 在lua文件中执行报错：lua: statement_expression.lua:1: unexpected symbol near '8'
-- tbl1[1] -- 报错: ua: statement_expression.lua:3: syntax error near 'X'
-- X -- 报错: lua: statement_expression.lua:4: syntax error near 'local'
local x = 1  
print(x)  -- 输出1
if x > 0 then print("ok") end -- 输出ok
return x
