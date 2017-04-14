TARGET_DIR=$1
if [ ! -d "$TARGET_DIR" ]; then
  echo "USAGE: $0 <TARGET_DIR>"
  exit 1
fi

for file in `find $TARGET_DIR -type f -exec grep -Iq . {} \; -and -print`; do
  sed -i '' -E 's/[[:space:]]+$//' $file
done
