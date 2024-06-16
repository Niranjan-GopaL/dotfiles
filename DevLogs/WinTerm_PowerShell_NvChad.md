# ABSOLUTELY FIRE THINGS I GOT IN NEOVIM 

1. THERE ARE DIFFERENT MODES IN TERMINAL :-

I copied the stuff in TERMINAL ; as if it was a text file 

┏[ HP from  Win-10][ 0s][ RAM: 7/7GB][ Monday at 1:31:21 AM][ main ≡  ~1]
┖[D:\Code Practise\dotfiles\DevLogs]

2. You can do git version control inside NVIM ; SPC + G + T 



In Neovim, particularly in setups like NvChad, there are different modes for working with the terminal:

1. *Normal Mode (`n`)*   : Standard mode, you can navigate and use various Vim commands.
2. *Insert Mode (`i`)*   : This is where you type text or interact with the terminal.
3. *Terminal Mode (`t`)* : This is specific to the terminal buffer where you interact with the shell directly.
4. *Visual Mode (`v`)*   : Used for selecting and manipulating blocks of text.

When you open a `terminal in Neovim` (including with setups like NvChad),
you can `switch between these modes` using keybindings.

### Switching Between Modes in Neovim Terminal

1. **Entering Terminal Mode**:
   - When you first open a terminal (`:term`), you are typically put into Terminal Mode (`t`).

2. **Switching to Normal Mode**:
   - To switch from Terminal Mode to Normal Mode, use `Ctrl-w` followed by `N`.
     Alternatively, you can use `Ctrl-\` followed by `Ctrl-n` to enter Normal Mode.

3. **Switching Back to Terminal Mode**:
   - To switch back to Terminal Mode from Normal Mode, press `i` or `a` to enter Insert Mode, and then interact with the terminal.
     ```vim
     i
     ```
     or
     ```vim
     a
     ```

### Keybindings in NvChad for Terminal Operations

NvChad provides some convenient keybindings and configurations for working with terminal buffers. Here are the default keybindings you can use:

[ In NvChad this is reserved for THEMES ; `SPC + h` is the KEY answer ]
1. **Open a New Horizontal Terminal**:
   - `SPC t h` (assuming `SPC` is the leader key in NvChad)

2. **Open a New Vertical Terminal**:
   - `SPC t v`

3. **Toggle the Terminal Visibility**:
   - `SPC t t` (This might require you to have the `nvim-toggleterm.lua` plugin configured as mentioned earlier)

### Example Configuration in NvChad

Here’s how you might configure your NvChad setup to handle terminal keybindings:

1. **Install and Configure ToggleTerm Plugin (Optional)**:
   If you haven't already, install the `nvim-toggleterm.lua` plugin for better terminal management:
   

   ```lua
   -- Add this to your NvChad custom configuration
   use 'akinsho/nvim-toggleterm.lua'
   
   -- Then set up the plugin
   require('toggleterm').setup{
       open_mapping = [[<leader>tt]],
       direction = 'horizontal',
       shade_terminals = true,
       start_in_insert = true,
       close_on_exit = false,
       shell = 'pwsh', -- or 'cmd.exe' if you prefer Command Prompt
   }
   ```

2. **Set Custom Keybindings**:
   Add custom keybindings to toggle terminal buffers:
   ```lua
   -- Assuming you use Lua for configuring NvChad
   vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
   ```

By configuring these keybindings and understanding the different modes in the terminal, you can efficiently toggle and manage terminal buffers within Neovim using NvChad. This setup will help you "minimize" terminal windows and switch between them without losing the running processes.




# Things I want in VIM
- MULTI-CURSOR
- How to change multiple instances of the word SIMULTANEOUSLY
- Absolutely loved NvChad
> It helps you when you are typing in commands ; just writing vim commands



# Windows Terminal

### Implemented

( followed devaslife's video)
- Made a profile.ps1 that loads 
    - oh-my-posh
    - all aliases
- This command is loaded everythime ( it's inside the user_profile.ps1 )
- You can change the theme by JUST `CHANGING THE NAME` in :-
> oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\hul10.omp.json" | Invoke-Expression 
#### Fav :-
- hul10 ; kushal ; kali


### Keybindings
- Ctrl + Shif + , => open the json config of windows Terminal in VSC


# NVChad

### Keybindings and Commands in NvChad

#### Basic Navigation
| Action                         | Keybinding                     | Description                                  |
| ------------------------------ | ------------------------------ | -------------------------------------------- |
| Move cursor left               | `h`                            | Move cursor to the left                      |
| Move cursor down               | `j`                            | Move cursor down                             |
| Move cursor up                 | `k`                            | Move cursor up                               |
| Move cursor right              | `l`                            | Move cursor to the right                     |
| Switch to normal mode in terminal | `Ctrl-w N`                 | Switch from terminal insert mode to normal   |

#### File Operations
| Action                         | Keybinding                     | Description                                  |
| ------------------------------ | ------------------------------ | -------------------------------------------- |
| Open file tree                 | `<leader>e`                    | Open NvimTree (file explorer)                |
| Find file                      | `<leader>ff`                   | Open Telescope file finder                   |
| Find text in project           | `<leader>fg`                   | Open Telescope live grep                     |
| Find buffer                    | `<leader>fb`                   | Open Telescope buffer list                   |
| File browser                   | `<leader>fv`                   | Open Telescope file browser                  |
| Save file                      | `:w`                           | Save the current file                        |
| Save file and quit             | `:wq`                          | Save the current file and quit               |
| Quit without saving            | `:q!`                          | Quit without saving                          |
| Open file by path              | `:e <file-path>`               | Open a file by specifying the path           |

#### Buffer Management
| Action                         | Keybinding                     | Description                                  |
| ------------------------------ | ------------------------------ | -------------------------------------------- |
| New buffer                     | `:enew`                        | Open a new empty buffer                      |
| Close buffer                   | `<leader>q`                    | Close the current buffer                     |
| Cycle to next buffer           | `<Tab>`                        | Switch to the next buffer                    |
| Cycle to previous buffer       | `<Shift-Tab>`                  | Switch to the previous buffer                |
| List open buffers              | `<leader>bl`                   | List all open buffers using Telescope        |

#### Window Management
| Action                         | Keybinding                     | Description                                  |
| ------------------------------ | ------------------------------ | -------------------------------------------- |
| Split window horizontally      | `Ctrl-w s`                     | Split the current window horizontally        |
| Split window vertically        | `Ctrl-w v`                     | Split the current window vertically          |
| Close current window           | `Ctrl-w q`                     | Close the current window                     |
| Navigate to window up          | `Ctrl-w k`                     | Move to the window above                     |
| Navigate to window down        | `Ctrl-w j`                     | Move to the window below                     |
| Navigate to window left        | `Ctrl-w h`                     | Move to the window to the left               |
| Navigate to window right       | `Ctrl-w l`                     | Move to the window to the right              |

#### Tab Management
| Action                         | Keybinding                     | Description                                  |
| ------------------------------ | ------------------------------ | -------------------------------------------- |
| New tab                        | `:tabnew`                      | Open a new tab                               |
| Next tab                       | `gt`                           | Move to the next tab                         |
| Previous tab                   | `gT`                           | Move to the previous tab                     |
| Close tab                      | `:tabclose`                    | Close the current tab                        |

#### Telescope
Telescope is a highly extensible fuzzy finder over lists. It is included in NvChad by default.

| Action                         | Keybinding                     | Description                                  |
| ------------------------------ | ------------------------------ | -------------------------------------------- |
| Find file                      | `<leader>ff`                   | Open Telescope file finder                   |
| Find text in project           | `<leader>fg`                   | Open Telescope live grep                     |
| Find buffer                    | `<leader>fb`                   | Open Telescope buffer list                   |
| Find help                      | `<leader>fh`                   | Open Telescope help tags                     |

### Example Usage Scenarios

1. **Open the file tree and navigate to a file:**
   - Press `<leader>e` to open the NvimTree file explorer.
   - Use `j` and `k` to navigate up and down.
   - Press `Enter` to open the selected file.

2. **Find and open a file using Telescope:**
   - Press `<leader>ff` to open the Telescope file finder.
   - Start typing the name of the file you want to open.
   - Use `j` and `k` to navigate the results and press `Enter` to open the selected file.

3. **Split the window and open a terminal:**
   - Press `Ctrl-w s` to split the window horizontally.
   - Type `:term` and press `Enter` to open a terminal in the new split.

4. **Cycle through open buffers:**
   - Press `<Tab>` to switch to the next buffer.
   - Press `<Shift-Tab>` to switch to the previous buffer.

### Notes
- `<leader>` is typically mapped to the `space` key in NvChad.
- This table covers the most commonly used keybindings and commands. As you get more comfortable, you can explore additional functionality and customize keybindings to suit your workflow.

Feel free to refer to the NvChad documentation and your `init.lua` configuration file for more details and customization options.
