require("orgmode").setup_ts_grammar()

local org_dir = "~/Sync/Org/"

require("orgmode").setup(
    {
        org_todo_keywords = {"TODO(t)", "NEXT", "STARTED", "|", "DONE", "CANCELLED", "MISSED"},
        org_todo_keyword_faces = {
            TODO = ":foreground #b80000 :weight bold :slant italic",
            NEXT = ":foreground #db3e00 :weight bold :slant italic",
            STARTED = ":foreground #fccb00 :weight bold :slant italic",
            DONE = ":foreground #008b02 :weight bold :slant italic",
            CANCELLED = ":foreground #c4def6 :weight bold :slant italic",
            MISSED = ":foreground #bed3f3 :weight bold :slant italic"
        },
        org_agenda_span = "day",
        org_agenda_files = {org_dir .. "*"},
        org_agenda_skip_deadline_if_done = false,
        org_default_notes_file = org_dir .. "refile.org",
        org_capture_templates = {
            j = {
                description = "Journal",
                template = '* %(return vim.fn.getreg "w")',
                -- get the content of register "w"
                target = org_dir .. "journal.org"
            }
        },
        mappings = {
            org = {
                org_toggle_checkbox = "<leader>oC"
            }
        }
        -- ui = {
        --     menu = {
        --         handler = function(data)
        --             local options = {}
        --             local options_by_label = {}
        --
        --             for _, item in ipairs(data.items) do
        --                 if item.key and item.label:lower() ~= "quit" then
        --                     table.insert(options, item.label)
        --                     options_by_label[item.label] = item
        --                 end
        --             end
        --
        --             local handler = function(choice)
        --                 if not choice then
        --                     return
        --                 end
        --
        --                 local option = options_by_label[choice]
        --                 if option.action then
        --                     option.action()
        --                 end
        --             end
        --
        --             vim.ui.select(options, {prompt = data.prompt}, handler)
        --         end
        --     }
        -- }
    }
)
