TEMP_FILE=tmp.txt

TARGET_DIR=$1
if [ ! -d "$TARGET_DIR" ]; then
  echo "USAGE: $0 <TARGET_DIR>"
  exit 1
fi

# Binary files are ignored
for file in `find $TARGET_DIR -type f -exec grep -Iq . {} \; -and -print`; do
  echo "=== $file ==="
  unexpand -t 4 $file > $TEMP_FILE
  mv $TEMP_FILE $file
  expand -t 2 $file > $TEMP_FILE
  mv $TEMP_FILE $file
done
