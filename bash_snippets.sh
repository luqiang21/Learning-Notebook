# Copy and change file name
for file in *.txt
do
  cp -i "$file" "$(basename "$file" .txt)_my.txt"
done

# Create folders named batch00 to batch99
mkdir batch{00..99}
