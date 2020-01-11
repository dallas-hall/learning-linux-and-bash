read -e -p "Enter absolute path for the repo: " DIRECTORY
# Check if $DIRECTORY exists.
if [ ! -d $DIRECTORY ]; then
    echo "Input directory doesn't exist, aborting."
    exit 1
fi

echo "Changing directory."
cd $DIRECTORY

echo "Deleting all remotes."
git remote rm gitlab; git remote rm github; git remote rm bitbucket; git remote rm origin

read -e -p "Enter repo name: " REPONAME

echo "Adding origin."
git remote add origin git@bitbucket.org:blindcant/"$REPONAME"


echo "Adding multiple push paths."
git remote set-url origin --push --add git@bitbucket.org:blindcant/"$REPONAME"
git remote set-url origin --push --add git@gitlab.com:blindcant/"$REPONAME"
git remote set-url origin --push --add git@github.com:blindcant/"$REPONAME"

echo "Setting upstream master."
#git push -u origin master
git push --set-upstream origin master

echo "Completed successfuly."
exit 0
