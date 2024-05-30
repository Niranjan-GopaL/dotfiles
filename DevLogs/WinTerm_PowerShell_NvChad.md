# Things I want in VIM
- MULTI-CURSOR
- How to change multiple instances of the word SIMULTANEOUSLY


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
- hul10


### Keybindings
- Ctrl + Shif + , => open the json config of windows Terminal in VSC


# NVChad
Sure! Here's a quick reference table for keybindings and commands in NvChad that will help you get started and become productive quickly:

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
