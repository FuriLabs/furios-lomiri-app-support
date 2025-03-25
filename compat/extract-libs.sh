#!/bin/bash
set -e

ARCH=$1
if [[ "$ARCH" != "amd64" && "$ARCH" != "arm64" ]]; then
    echo "Unsupported arch: $ARCH"
    exit 1
fi

WORKDIR="$(dirname "$0")"
DEBDIR="$WORKDIR/${ARCH}-debs"
EXTRACTDIR="$WORKDIR/extracted"
OUTDIR="$WORKDIR/lib"

rm -rf "$EXTRACTDIR" "$OUTDIR"
mkdir -p "$EXTRACTDIR" "$OUTDIR"

for DEB in "$DEBDIR"/*.deb; do
    echo "Extracting: $DEB"
    TMPDIR=$(mktemp -d)
    dpkg-deb -x "$DEB" "$TMPDIR"

    cp -a "$TMPDIR"/* "$EXTRACTDIR/"
    rm -rf "$TMPDIR"
done

# Copy all .so* files (including symlinks) into lib/
find "$EXTRACTDIR" -path "$OUTDIR" -prune -o \
    -name "*.so*" \( -type f -o -type l \) \
    -exec cp -a --no-dereference {} "$OUTDIR/" \;
