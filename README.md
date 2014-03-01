###survey_gorilla
#####Group Contributors: Joe Wilmoth / Jay Rogers / Tara Roys / Dustin Fox / Diana Calvache
==========================================================================================
GIT WORKFLOW

DO THIS REALLY OFTEN SO ANY MERGE CONFLICTS ARE SUPER MINOR. KEEP BRANCH FEATURES TINY TINY. LITERALLY, EVERY TIME YOU MAKE 3 LINES OF CODE CHANGES OR SOMETHING LIKE THAT

GETTING STARTED (ESTABLISHING A NEW FEATURE BRANCH)

Checkout branch master (git checkout master)
Pull the latest master branch (git pull)
Checkout a new branch named for your feature (git checkout -b branchname)
Add your branch to the remote repository (git push -u origin branchname)
Continue working on your branch, git add --all and git commit often.
Move on to the next steps.
STEPS FOR MERGING YOUR BRANCH INTO MASTER

git add and git commit your final changes on your branch
Push the latest version of your branch up to its remote on github (git push -u origin yourbranchname)
Go to our project page on github. Select your branch from the dropdown menu of branches, making sure that your latest push went through from step 3.
Click the bright green "Compare and Pull Request" button
In the message box, write what you think should be done with the merge conflicts outlined, if any.
Click "submit pull request"
Mama merge will review the changes and make sure the people who are conflicting with their code are pulled in if necessary.

ETIQUETTE

git add --all, git commit -m "x" OFTEN
DO NOT INCLUDE MULTIPLE FEATURES IN ONE BRANCH. FOR THE LOVE OF GOD.
