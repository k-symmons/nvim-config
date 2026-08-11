require("kazuki.core")
require("kazuki.lazy")

vim.api.nvim_create_user_command('42cc', '!cc -Wall -Wextra -Werror %:S && ./a.out', {})
