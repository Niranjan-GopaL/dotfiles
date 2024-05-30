## Initial Worries
- Best way to install packages and use them in jupyter notebooks :-
    - create virtual env ; install tensorflow ipykernel ; 
    - python -m ipykernel install --user --name=name_of_the_new_jypternotebook
    - open jupyterNotebook -> Click on New you'll see the New notebook



- Keybindings ?
    - ctrl + shift + H := help
    - ctrl + shift + C := command palatte


- How to open it in browser ( once I am comfortable there, I'll do it in VSC )
    - Made a config file ```$ jupyter notebook --generate-config ```
    - made 2 modifications :- defaultBrowser="path to chrome" ; NotebookApp.use_rediret_file = True
    - made a powershell alias : Mapped `jn` -> jupyter notebook --notebook-dir=D:/"Code Practise"


