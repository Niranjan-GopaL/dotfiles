### Initial Things done+

0. Make a DevFile to record everything
1. Log in to Github via ssh 
2. Common Utilities
   1. Connect to Bluetooth 
   2. Zathura Zathura-pdf-popler ( further customisation later ) 
   3. Made .zshrc  be here ~/.config/zsh/.zshrc
   <!-- 4. made .config A REPOSITORY -->
   4. install ranger, image viewer `see your images in terminal lol`  
   5. install tor 
```sh
   sudo pacman -Sy ranger
   sudo yay -Sy ueberzugq
```
   5. cava + mcp + ncmpcpp => $MUSIC
3. zsh abbrv-alias IS GOD-TIER ;
4. Dev Utilities
   0. `sudo pacman -Sy timew` <-- Time spent in command line
   1. Installing tmux 
   2. Installing nvm, node, npm, GITHUB CLI (gh) in terminal 
   3. Docker [PLEASE_WORK]
5. Signed in to Mozilla to keep Consistent stuff
   - used legendsonthemove1111@gmail.com to sign in
   - add-ons don't persist ?

> [PUSH ALL THE SIGNATURES TO GITHUB] 




## 7. Installing mpd ( Music Player Daemon ) + NCMPCPP ( front-end for it, manages music, lyrics fetch, vizulisation )


## 6. Installing neovim
```sh
sudo pacman -Sy neovim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```

## 5. Installing nvm, npm, yaarn
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

nvm list-remote

nvm install node
```


## 4. All the foldings made in this file is PERSISTENT 

Adding this to config :-

>  "editor.foldingStrategy":"auto",



## 3. Moving .zshrc to be inside .config

Quick commands ; Detailed gpt response below

```sh
$ mkdir -p ~/.config/zsh
$ mv ~/.zshrc ~/.config/zsh/.zshrc

$ ln -s ~/.config/zsh/.zshrc ~/.zshrc

# verification
$ ls -l ~/.zshrc
# You need to see something like :-
# ~/.zshrc -> ~/.config/zsh/.zshrc

```

Given that you are using the setup from the Prasanth Rangan repository, and all your configuration files are already organized within `~/.config`, it's important to maintain compatibility and avoid breaking any scripts or setups that rely on the standard location of `.zshrc`.

However, since you prefer to keep all configuration files in `~/.config`, let's carefully proceed by:

1. **Identifying Dependencies**:
   - Check any scripts or applications that might directly reference `~/.zshrc`.
   - Ensure that moving `.zshrc` won't disrupt any dependencies.

2. **Creating a Symlink**:
   - Instead of moving `.zshrc`, create a symlink from `~/.zshrc` to the new location within `~/.config`.

Here's how you can proceed:

### Steps to Move and Symlink `.zshrc`

1. **Move Your `.zshrc` to `~/.config/zsh/.zshrc`**:

   Create the necessary directory and move your `.zshrc` file:

   ```sh
   mkdir -p ~/.config/zsh
   mv ~/.zshrc ~/.config/zsh/.zshrc
   ```

2. **Create a Symlink in the Home Directory**:

   Create a symbolic link from `~/.zshrc` to the new location:

   ```sh
   ln -s ~/.config/zsh/.zshrc ~/.zshrc
   ```

### Verifying the Symlink

Ensure the symlink works by listing the details:

```sh
ls -l ~/.zshrc
```

You should see something like:

```sh
   ~/.zshrc -> ~/.config/zsh/.zshrc
```

### Testing the Configuration

1. **Reload Zsh**:

   Reload your Zsh configuration to ensure it's working properly:

   ```sh
   source ~/.zshrc
   ```

2. **Verify Functionality**:

   Add a test line to your new `.zshrc` in `~/.config/zsh/.zshrc` to confirm it's being sourced correctly:

   ```sh
   echo "Sourcing ~/.config/zsh/.zshrc"
   ```

Open a new terminal session, and you should see the message indicating the `.zshrc` file from `~/.config/zsh` is being sourced.

### Summary

By moving your `.zshrc` to `~/.config` and creating a symlink in the home directory, you maintain compatibility with any applications or scripts that expect to find `.zshrc` in the home directory while keeping your configuration files organized in `~/.config`. This approach provides the best of both worlds: cleanliness and compatibility.


## 2. Bluetooth
All you need is :-
```sh
$ blueman-manager
``` 

## 1. Connecting to Github in terminal via ssh [ GPT-4o ]

To set up SSH for GitHub and use it for pushing and pulling from your terminal, follow these steps:

### Step 1: Generate an SSH Key

1. **Open your terminal.**
2. **Generate a new SSH key:**

   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   - This creates a new SSH key, using the provided email as a label.
   - When you're prompted to "Enter a file in which to save the key," press Enter to accept the default file location.

3. **You will be prompted to enter a passphrase.** You can enter a passphrase for added security, or leave it empty.

### Step 2: Add the SSH Key to the SSH Agent

1. **Start the SSH agent in the background:**

   ```sh
   eval "$(ssh-agent -s)"
   ```

2. **Add your SSH private key to the SSH agent:**

   ```sh
   ssh-add ~/.ssh/id_rsa
   ```

### Step 3: Add the SSH Key to Your GitHub Account

1. **Copy the SSH key to your clipboard:**

   ```sh
   cat ~/.ssh/id_rsa.pub
   ```

   - Copy the output from the terminal, which is your SSH public key.

2. **Add the SSH key to your GitHub account:**

   - Go to [GitHub SSH settings](https://github.com/settings/keys).
   - Click "New SSH key."
   - In the "Title" field, add a descriptive label for the new key (e.g., "My Laptop").
   - Paste your key into the "Key" field.
   - Click "Add SSH key."

### Step 4: Test the SSH Connection

1. **Test your connection:**

   ```sh
   ssh -T git@github.com
   ```

   - You should see a message like: "Hi `username`! You've successfully authenticated, but GitHub does not provide shell access."

### Step 5: Configure Git to Use SSH

1. **Set your Git username and email:**

   ```sh
   git config --global user.name "Your Name"
   git config --global user.email "your_email@example.com"
   ```

2. **Add your remote repository URL using SSH:**

   ```sh
   git remote add origin git@github.com:username/repository.git
   ```

   - Replace `username` with your GitHub username.
   - Replace `repository` with the name of your repository.

### Step 6: Push and Pull Using SSH

1. **Clone a repository using SSH:**

   ```sh
   git clone git@github.com:username/repository.git
   ```

2. **Push changes to the repository:**

   ```sh
   git add .
   git commit -m "Your commit message"
   git push origin main
   ```

   - Replace `main` with the name of the branch you want to push to.

3. **Pull changes from the repository:**

   ```sh
   git pull origin main
   ```

   - Replace `main` with the name of the branch you want to pull from.

By following these steps, you will have configured your terminal to use SSH for GitHub, allowing you to securely push and pull code from your repositories.


# Keybindings


### Zathura

` $ zathura .pdf & disown `
` $ something & disown` 
This is how you run something ( generally a GUI application if you launch through Terminal )

- :open            <-- Tab complete and open a file in current session
- :info            <-- All metadata info (when this was made, etc)
- :bmark <name>    <-- add current page as <name> to bookmark
- :blist           <-- Show all bookmarks available
- :blist <name>    <-- got to that bookmark
- :bdelete         <-- prompt to delete a bookmark
- ctrl+n           <-- you can see the page number in bottom right

Navigation
- H/L <-- goes  to top / bottom of the page
- jkhl / JKHL / arrow keys  
- Tab + hjkl <-- Table of Contents [Hyprlinks?]
- :10 ( 10th page ) 
- nG  ( go to nth page)
- Create temporary bookmarks :-
   m + [0-9] <-- creates a temp bookmark on that page and store that in the number[0-9]
   ' + [0-9] <-- go to the page associated with that number


- Ctrl + R  <-- Invert colors
- /         <-- search forward  ( just like in vim )
- Shift + / <-- search backward
- = + -     <-- zooming ( control + scroll also ) 
- 60=       <-- zoom by 60% ( similar 150= 300= etc ) 


Interface Navigation :-


- f/F <-- follow link
- D/d <-- booklet form 
- R   <-- Rotate current pag by 90
- A   <-- Fit Back to the Screen size
- Q   <-- Terminate session
- Ctrl + N <--- toggle information bar
- Ctrl + M <--- toggle input field
- Ctrl + F11 (F11) <--- Fullscreen mode


### Hyprland

Understand Keybindings.conf to set KNOW IT ALL !!!

- Sup + shift + w            : Change wallpaper from list
- Sup + J                    : Change orientation
- Sup + alt + S              : move to special workspace
- Sup + shift + Ctrl + arrow : move relative to curr workspace


- super + ctrl + down      : Move to first empty workspace [SO_GOOD]
- super + mouse_roll       : mouse through workspace 

- ctrl + alt + w           : toggle waybar 

- sup + shift + w          : select wallpaper in the theme
- sup + shift + t          : Select theme
- sup + alt + up / down    : cycle through WAYBAR
- sup + alt + left / right : cycle through workspace
- f11 / f12                : Volume Up and Down 


- sup + p                  : partial screenshot
- sup + ctrl + p           : partial screenshot (FROZEN)


- sup + shift + [0-9]      : Move focused widnow to that workspace
- sup + [0-9]              : Go to that workspace


- sup + backspace          : wlogout menu


### VIM
- using f to traverse in a line is insane;
- the reason why vim has % $ for bindings is because they ran out of keys ; everything was already bound to something ;
- I remapped 0 and $ to 1 and 2 ( since i rarelu use recursive vim stuff like 2j 2<C-a> etc )
- :viB select inside block
- 3ctrl + a => increases the number under cursor by 3   3 -> 6
- 3ctrl + x => decreases the number under curose by 3   3 -> 0 
- remapped start of line, end of line => 1,2
- HL to half a page up/down [Still need getting used to ]
- H and L are best ; if you wanna go up mindlessly? JK is the way
- BUT USE MARKERS
  ma     <- bookmarker on a
  `a     <- go to that bookmark
  :marks <- shows all the marks set
  :delmarks a s d f <- deletes all those book marks


### VSC

[VSCode Too God stuff]
- Ctrl+Q := Select next same selection
  // NOTE : on pressing ctrl+Q YOU WILL BE IN `VISUAL MODE` 
  //        --> JUST PRESS `v` AND YOU WILL BE BACKE TO BE IN NORMAL MODE , 
  //        --> ( or press `I`) to go to insert mode DIRECTLY but most of the times you would wanna be in normal mode



- Search Editor => can you search and replace all the occurance of something across all files ; selectively changes some of them,etc
  (`shift+alt+f shift+alt+f`)
- Really powerful way to go through ANYTHING => `ctrl+shift+o` this will DISPLAY ALL OBJECTS IN VSC
- `gh` => will show whatever we see when we hover over that (DOCUMENTATION)


- Fold / Unfold                     : ctrl + shift + [ ] 
- togggle activityBar visibility    : ctrl + shift + ' /
- toggle minimap visibility         : ctrl + shift + /

- Cycle tabs according to position  : Add snippets to keybindings.json 

