## Game plan for today :-
- Finish Face_recognition App
- Finish first 5 videos by Afternoon


## Initial Worries
- FUCK, tensor flow latest version don't support gpu in Windows Native ( need to use wsl2 )
- FUCK, requires different version of python

## Jupyter Notebook Functionalities

- Jupyter Notebook themes
```ipynb
! jt -l
! jt -t gruvbox
! jt -nf  ( to change the font, customize in this files )
```

- Keybindings ?
    - convert cell to code     => ctrl + M , Y
    - convert cell to markdown => ctrl + M , M

    - ctrl + enter  => run cell advance
    - shift + enter => run the cell and advance
    - alt + enter   => run only the current cell and advance to next cell
    - ctrl + M + j/k to navigate ( Vim Navigation )
        - dd to delte cell
        - a to inset above
        - b to insert below 
    - ctrl + shift + H := help
    - ctrl + shift + C := command palatte

- See documentation of anything :-
    `plt.imshow??`


- Best way to install packages and use them in jupyter notebooks :-
    - create virtual env ; install tensorflow ipykernel ; 
    - python -m ipykernel install --user --name=name_of_the_new_jypternotebook
    - open jupyterNotebook -> Click on New you'll see the New notebook


- How to open it in browser ( once I am comfortable there, I'll do it in VSC )
    - Made a config file ```$ jupyter notebook --generate-config ```
    - made 2 modifications :- defaultBrowser="path to chrome" ; NotebookApp.use_rediret_file = True
    - made a powershell alias : Mapped `jn` -> jupyter notebook --notebook-dir=D:/"Code Practise"


