#update.sh
echo "Starting ReadTheDocs Update Script"
read -p "Enter github commit message: " message
make.exe html
git add .
git commit -m message
git push
echo "Finished."