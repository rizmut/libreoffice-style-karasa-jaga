#!/bin/sh

set -e

gh_repo="libreoffice-style-karasa-jaga"
gh_desc="Karasa Jaga LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

temp_dir="$(mktemp -d)"

cd "build/images_karasa_Jaga"
zip -r -D images_karasa_Jaga.zip *
cp -R "images_karasa_Jaga.zip" \
  "./.."
cd "./../.."
echo "=> Deleting old $gh_desc ..."
sudo rm -f "/usr/share/libreoffice/share/config/images_karasa_Jaga.zip"
echo "=> Installing ..."
sudo mkdir -p "/usr/share/libreoffice/share/config"
sudo mv \
  "build/images_karasa_Jaga/images_karasa_Jaga.zip" \
  "/usr/share/libreoffice/share/config"
for dir in \
  /usr/lib64/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config \
  /usr/lib/openoffice/share/config \
  /opt/openoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo ln -sf "/usr/share/libreoffice/share/config/images_karasa_Jaga.zip" "$dir"
done
echo "=> Pushing to git ..."
git add .
git commit -m "New build"
git push origin master
echo "=> Done!"
