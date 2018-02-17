#!/bin/sh

set -e

gh_repo="libreoffice-style-karasa-jaga"
gh_desc="Karasa Jaga LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

echo "=> Removing $gh_desc ..."
for dir in \
  /usr/share/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/lib64/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo rm -f "$dir/images_karasa_Jaga.zip"
done
echo "=> Done!"
