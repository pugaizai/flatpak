#!/bin/sh

declare -a apps=(
"manifests/org.freedesktop.Platform.electron/org.freedesktop.Platform.electron.yaml"
"manifests/com.cherry_ai.cherrystudio/com.cherry_ai.cherrystudio.yaml"
"manifests/io.github.wgh136.pixes/io.github.wgh136.pixes.yaml"
"manifests/io.github.venera_app.venera/io.github.venera_app.venera.yaml"
"manifests/top.jtmonster.jhentai/top.jtmonster.jhentai.yaml"
"manifests/com.qq.weixin/com.qq.weixin.yaml"
"manifests/com.qq.qq/com.qq.qq.yaml"
"manifests/com.qq.docs/com.qq.docs.yaml"
"manifests/com.qq.qqmusic/com.qq.qqmusic.yaml"
"manifests/io.github.c0re100.qbittorrent-enhanced-edition/io.github.c0re100.qbittorrent-enhanced-edition.yaml"
"manifests/io.github.msojocs.bilibili/io.github.msojocs.bilibili.yaml"
"manifests/org.freedesktop.xorg.xeyes/org.freedesktop.xorg.xeyes.yaml"
"manifests/io.github.pbh_btn.peerbanhelper/io.github.pbh_btn.peerbanhelper.yaml"
"manifests/com.larksuite.lark/com.larksuite.lark.yaml"
"manifests/cn.feishu.feishu/cn.feishu.feishu.yaml"
)

for app in "${apps[@]}"; do
    flatpak run org.flathub.flatpak-external-data-checker "$app" --edit
done
