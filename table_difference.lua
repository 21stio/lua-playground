local inspect = require 'inspect'

function difference(a, b)
    local aa = {}
    for k,v in pairs(a) do aa[v]=true end
    for k,v in pairs(b) do aa[v]=nil end
    local ret = {}
    local n = 0
    for k,v in pairs(a) do
        if aa[v] then n=n+1 ret[n]=v end
    end
    return ret
end

table_a = {"a", "c", "b"}
table_b = {"a", "b" }

diff = difference(table_a, table_b)

print(inspect(diff))