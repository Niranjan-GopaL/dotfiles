```sh

git checkout -b branch_name # creates a new branch pointer AND makes the asterisc go to that branch
git merge bugFix

git checkout bugFix
git merge branch_2

# when you are in branch feature/new_button
git rebase main

```