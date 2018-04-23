#!/bin/sh

set -e

gh_repo="libreoffice-style-karasa-jaga"
gh_desc="Karasa Jaga LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF
echo "=>Remove old extension"
rm -f "build/Karasa_Jaga-IconSet.oxt"
echo "=>Create the new one"
cd "build"
cp "images_karasa_Jaga.zip" \
   "Karasa_Jaga-IconSet/iconsets"
cd "./Karasa_Jaga-IconSet"
zip -r -D Karasa_Jaga-IconSet.oxt *
mv "Karasa_Jaga-IconSet.oxt" \
   "./.."
