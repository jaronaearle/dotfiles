local map = vim.keymap.set

NMap = function(key, cmd, opt)
    map("n", key, cmd, opt)
end

VMap = function(key, cmd, opt)
    map("v", key, cmd, opt)
end

IMap = function(key, cmd, opt)
    map("i", key, cmd, opt)
end

AllMap = function(key, cmd, opt)
    local modes = {"n", "v", "i"}

    for i = 1, #modes do
        map(modes[i], key, cmd, opt)
    end
end
