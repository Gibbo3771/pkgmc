local json = require("JSON")
local lfs = require("lfs")

local output = {}

function attrdir (path)
    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local f = path..'/'..file
            print ("\t "..f)
            local func, err = load(f)
            if func then
                local ok, f = pcall(func)
                if ok then
                    print(f.name)
                else
                    error("Could not execute formula")
                end
            else
                error("Could not compile formula")
            end
        end
    end
end

attrdir ("./formula")
