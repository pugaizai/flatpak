#!/bin/bash
set -e
shopt -s failglob
FLATPAK_ID="${FLATPAK_ID:-cn.wps.office}"

mkdir -pv deb-package export/share

bsdtar --to-stdout -xf wps-office.deb data.tar.xz | bsdtar -xf - -C deb-package

mv -v deb-package/opt/kingsoft/wps-office .
mv -v deb-package/usr/bin/{misc,wps,wpp,et,wpspdf} wps-office/
mv -v deb-package/usr/share/{icons,applications,mime} export/share/

YEAR_SUFFIX=2023

rename -v --no-overwrite "wps-office-" "${FLATPAK_ID}." export/share/{icons/hicolor/*/*,applications,mime/packages}/wps-office-*.*
rename -v --no-overwrite "wps-office${YEAR_SUFFIX}-" "${FLATPAK_ID}." export/share/icons/hicolor/*/*/wps-office${YEAR_SUFFIX}-*.*

for a in wps wpp et pdf prometheus; do
    desktop_file="export/share/applications/${FLATPAK_ID}.$a.desktop"
    appbin="$a"
    appicon="${FLATPAK_ID}.${a}main"
    case "$a" in
        pdf)
            appbin=wpspdf
        ;;
        prometheus)
            appbin=wps
            appicon="${FLATPAK_ID}.k${a}"
            # Use this as the main .desktop file for the Flatpak
            new_desktop_file="$(dirname $desktop_file)/${FLATPAK_ID}.desktop"
            mv $desktop_file $new_desktop_file
            desktop_file=$new_desktop_file
        ;;
    esac
    echo "Editing .desktop files"
    desktop-file-edit \
        --set-key="Exec" --set-value="$appbin %f" \
        --set-key="Icon" --set-value="$appicon" \
        --set-key="X-Flatpak-RenamedFrom" --set-value="wps-office-$a.desktop;" \
        "$desktop_file"
done

echo "Editing mime .xml icon"
sed -i "s/generic-icon name=\"wps-office-/icon name=\"${FLATPAK_ID}./g" "export/share/mime/packages/${FLATPAK_ID}".*.xml

# Just use libstdc++.so.6 from the runtime; allows working with runtime 23.08+
rm -v wps-office/office6/{libstdc++.so.6,libbz2.so}

rm -rv wps-office.deb deb-package

echo "Removing plugin path so we can override the default path with based on QT_PLUGIN_PATH"
sed -i 's|^Plugins=.*||g' wps-office/office6/qt.conf
