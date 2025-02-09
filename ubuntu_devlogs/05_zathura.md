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
