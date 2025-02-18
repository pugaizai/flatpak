# Pugaizai's Flatpaks

## [Flatpak List](https://github.com/pugaizai/flatpak/tree/main/manifests)

## Use My Repo

### Add Repo

`flatpak remote-add --if-not-exists pugai https://flatpak.pugai.life/pugai.flatpakrepo --user`

### Install Something

`flatpak install pugai <application-id> -y`

### Update

`flatpak update -y`

### Remove

`flatpak remove <application-id> -y`

### Remove Repo

`flatpak remote-delete pugai -y`

## Or Build Your Own

### Install Flatpak Builder

### Clone

`git clone https://github.com/pugaizai/flatpak.git --recursive`

### Build

`flatpak-builder build-dir manifests/<application-id>/<application-id>.yml --repo=repo --force-clean --install-deps-from=flathub --ccache --user`

### Add Repo

`flatpak --user remote-add --no-gpg-verify local repo`

### Install

`flatpak --user install local <application-id>`

### Update

`flatpak update`

### Remove

`flatpak remove <application-id> -y`

### Remove Repo

`flatpak remote-delete local -y`
