# Copy and change file name
for file in *.txt
do
  cp -i "$file" "$(basename "$file" .txt)_my.txt"
done
