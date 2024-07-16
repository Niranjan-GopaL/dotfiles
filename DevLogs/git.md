## Sigining commits with GPG keys ( GNU Encryption  )

- Sign your commits with GPG Keys
- Password command line utility :- `pass` to store all the GPG keys and secrets


```sh
sudo pacman -S gnupg
```

## Branching in this repo

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




```