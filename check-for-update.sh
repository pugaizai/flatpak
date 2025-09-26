#!/bin/bash

# 获取所有子目录，然后匹配同名的 yaml 文件
apps=()
for dir in manifests/*/; do
    # 去掉末尾的斜杠，获取目录名（应用ID）
    app_id=$(basename "$dir")
    yaml_file="manifests/$app_id/$app_id.yaml"
    
    # 检查文件是否存在且是普通文件
    if [ -f "$yaml_file" ]; then
        apps+=("$yaml_file")
    fi
done

if [ ${#apps[@]} -eq 0 ]; then
    echo "错误: 未找到与应用ID同名的 YAML 文件"
    echo "期望的文件路径: manifests/应用ID/应用ID.yaml"
    exit 1
fi

echo "找到 ${#apps[@]} 个有效应用清单:"
printf '%s\n' "${apps[@]}"
echo "----------------------------------------"

# 处理每个应用
for app in "${apps[@]}"; do
    echo "正在处理: $(basename "$app")"
    flatpak run org.flathub.flatpak-external-data-checker "$app" --edit
    echo "完成: $(basename "$app")"
    echo "----------------------------------------"
done

echo "所有应用处理完成!"
