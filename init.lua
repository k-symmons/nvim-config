require("kazuki.core")
require("kazuki.lazy")

vim.api.nvim_create_user_command('Cc42', '!cc -Wall -Wextra -Werror %:S && ./a.out', {})
