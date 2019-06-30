#!/bin/sh

set -e

gh_repo="libreoffice-style-karasa-jaga"
gh_desc="Karasa Jaga LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

temp_dir="$(mktemp -d)"

cd "images_karasa_jaga"
zip -r -D images_karasa_jaga.zip *
mv "images_karasa_jaga.zip" \
  "./../build/"
cd "./.."
echo "=> Deleting old $gh_desc extension file ..."
rm -f "build/Karasa_Jaga-IconSet.oxt"
echo "=> Create new $gh_desc extension one ..."
cp "build/images_karasa_jaga.zip" \
   "build/Karasa_Jaga-IconSet/iconsets"
cd "build/Karasa_Jaga-IconSet"
zip -r -D Karasa_Jaga-IconSet.oxt *
mv "Karasa_Jaga-IconSet.oxt" \
   "./.."
cd "./../.."
echo "=> Deleting old $gh_desc ..."
sudo rm -f "/usr/share/libreoffice/share/config/images_karasa_jaga.zip"
echo "=> Installing ..."
sudo mkdir -p "/usr/share/libreoffice/share/config"
sudo mv \
  "build/images_karasa_jaga.zip" \
  "/usr/share/libreoffice/share/config"
for dir in \
  /usr/lib64/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo ln -sf "/usr/share/libreoffice/share/config/images_karasa_jaga.zip" "$dir"
done
echo "=> Done!"
