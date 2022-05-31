local m = {}

function m.copy_file_path()
    local file_path = vim.fn.expand("%")
    vim.fn.setreg("+", file_path)
end

return m
