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

function testDifference()
    table_a = {"a", "c", "b"}
    table_b = {"a", "b", "e" }

    diff_a_to_b = difference(table_a, table_b)
    diff_b_to_a = difference(table_b, table_a)

    print("diff_a_to_b")
    print(inspect(diff_a_to_b))

    print("diff_b_to_a")
    print(inspect(diff_b_to_a))
end

function extractKey(key, data)
    local keys = {}
    for k,value in pairs(data) do
        table.insert(keys, value[key])
    end

    return keys
end

function testExtractKey()
    local data = {
        {name = "Peter", age = 18},
        {name = "Lili", age = 21},
    }

    local keys = extractKey("name", data)

    print("keys")
    print(inspect(keys))
end

function transformArrayToMapByKey(key, data)
    local map = {}
    for k,value in pairs(data) do
        map[value[key]] = value
    end

    return map
end

function testTransformArrayToMapByKey()
    local data = {
        {name = "Peter", age = 18},
        {name = "Lili", age = 21},
    }

    local map = transformArrayToMapByKey("name", data)

    print("map")
    print(inspect(map))
end

function testDefaultValue()
    local foo = nil or "bar"

    print(foo)
end

testTransformArrayToMapByKey()
