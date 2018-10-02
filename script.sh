#/bin/bash
############################################################
# Script to clone the repository which provided as argument
# and pass the directories to the python scripts and 
# output script and then it will process by flyway tool
# for database migration
############################################################
clear
echo "-------------------------"
echo "Total number of args = $#"
echo "-------------------------"
repo_url=https://github.com/
repo_user=wwinay/
###########################
# Function to clone the repo
###########################
for project in $@
do
echo "-------------------------------"
echo "The Project = $project"
echo "-------------------------------"
#echo "$project" > repo_project.txt
echo "Cloning the repo $repo_url$repo_user$project"
echo "--------------------------------------------"
echo ""
git clone $repo_url$repo_user$project
echo ""
done
#script_project=python
#git clone $repo_url$repo_user$script_project
##################################################
# passing the arguments cloned repositories to 
# python scripts as argument along with output file
##################################################
echo "
$(for arg in $@
do
echo "$(pwd)/$1"
shift
done) after_migration.txt" | xargs ./tests.sh


