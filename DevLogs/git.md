## Main Objective :-

- How to have 2 local repositories collaborate
- how to branch properly
- there is BOUND TO BE merge conflicts
- merge conflicts are good ?

#### First thought :-

> `3 branches` :- `main`, `eos`, `dos++` 
> - `eos` will have all the things commited from eos 
> - `dos++` will have all the things commited from windows 10
> - merge to `main` from either whenever considerable changes have been made through a PULL REQUEST ?




--- 

```sh
# this is the most INSANE thing
# go to any repo in github IN BROWSER,
#                => press ` . `
# you have dev environment where you can work on !!!! [You can do ANYTHING you could do LOCALLY]



## CLI

git config --global alias.ac "commit -am"

git ac "this is basically `git commit -am` "



# TYPO IN `LAST` COMMIT 
git commit --ammend -m "The typo has been fixed"


# How to add more changes to last commit
git add forgot_to_stage.sh forgot_to_stage_2sh
git commit --ammend --no-edit # --no-edit is for preserving the SAME COMMIT MESSAGE




``````sh

git checkout -b branch_name # creates a new branch pointer AND makes the asterisc go to that branch
git merge bugFix

git checkout bugFix
git merge branch_2

# when you are in branch feature/new_button
git rebase main

```