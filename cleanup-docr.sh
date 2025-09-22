DIGESTS=$(doctl registry repository lm $1 --format Digest,UpdatedAt,Tags | tail -n +2 | sort -rk2 | grep -v -E "$3" | awk '{print $1}' | tail -n +$(($2+1)))
echo Digests to remove: $DIGESTS

for DIGEST in $DIGESTS; do
  CMD="doctl registry repository delete-manifest $1 $DIGEST --force"
  echo Running $CMD
  $CMD
done

echo Manifest Digests removed: $DIGESTS

CMD="doctl registry garbage-collection start --include-untagged-manifests --force"
echo Running $CMD
$CMD
