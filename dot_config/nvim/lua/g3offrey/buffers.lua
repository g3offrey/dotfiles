local m = {}

local function has_more_than_1_buffer_open()
    local buffers = vim.api.nvim_list_bufs()

    local number_of_open_buffers = 0
    for _, buffer in ipairs(buffers) do
        if vim.fn.buflisted(buffer) == 1 then
            number_of_open_buffers = number_of_open_buffers + 1
        end

        if number_of_open_buffers > 1 then
            return true
        end
    end

    return false
end

function m.delete_buffer_and_go_to_previous_if_exists()
    local current_buffer = vim.fn.bufnr()
    local alternate_buffer = vim.fn.bufnr("#")

    if has_more_than_1_buffer_open() then
        local is_alternate_buffer_listed = vim.fn.buflisted(alternate_buffer) == 1

        if is_alternate_buffer_listed then
            vim.cmd("b#")
        else
            vim.cmd("bp")
        end
    end

    vim.cmd("bd" .. current_buffer)
end

return m
