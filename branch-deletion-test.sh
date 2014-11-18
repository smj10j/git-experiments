#!/bin/zsh


function title() {
    echo "\e[32m$1\e[0m"
}


echo ""
title "================================================"
title "========== Git Branch Deletion Test ============"
title "================================================"
echo ""

title ""
title "Setup"
rm -rf test-branch-deletes
mkdir test-branch-deletes
cd test-branch-deletes
git init
touch file-a
touch file-b
touch file-c
touch file-d
touch file-e







title ""
title "Create two branches, make 5 commits, and merge branches back into master"
git add file-a
git commit -m "adding file-a to master"
git checkout -b branch-one
git add file-b && git commit -m "adding file-b to branch-one"
git add file-c && git commit -m "adding file-c to branch-one"
git checkout master
git add file-d && git commit -m "adding file-d to master"
git checkout -b branch-two
git add file-e && git commit -m "adding file-e to branch-two"
git checkout master

# This shows a rebase that is committed and merged and then reverted
# git checkout branch-one
# git rebase master
# git checkout master
# git merge --no-ff branch-one
# git reset --soft HEAD~1
# git checkout branch-one
# git reset --soft HEAD~1
# git add file-c && git commit -m "adding file-c to branch-one"
# git checkout master








echo ""
echo ""
title "Before merge"
git-show-tree | less -F
git shortlog | less -F

echo ""
title "After merge of branch-two into master"
git merge --no-edit --no-ff branch-two
git-show-tree | less -F
git shortlog | less -F

echo ""
title "After merge of branch-one into master"
git merge --no-edit --no-ff branch-one
git-show-tree | less -F
git shortlog | less -F

echo ""
title "After deletion of branch-one"
git branch -d branch-one
git-show-tree | less -F
git shortlog | less -F

echo ""
title "After deletion of branch-two"
git branch -d branch-two
git-show-tree | less -F
git shortlog | less -F


echo ""
echo ""
echo "Showing several visualizations next to each other to allow comparison"
echo ""


echo ""
title "The shortlog"
git shortlog | less -F

echo ""
title "The reflog"
git reflog | less -F

echo ""
title "A decorated git log graph"
git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x20%Cgreen(%ar)%x1b[0m" | less -F

echo ""
title "Opening gitk in 2s for you to visually compare"
sleep 2
gitk






echo ""
cd ../
#rm -rf test-branch-deletes

echo ""
echo ""
title "================================================"
echo ""
echo ""
echo ""
