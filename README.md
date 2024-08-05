# Pugaizai's Flatpaks

## Use My Repo (X86_64 Only)

### Add Repo

`flatpak remote-add --if-not-exists pugai https://flatpak.pugai.life/pugai.flatpakrepo -y`

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

`flatpak install org.flatpak.Builder`

### Clone

`git clone https://github.com/pugaizai/flatpak.git --recursive`

### Build

`flatpak run org.flatpak.Builder build-dir manifests/<application-id>/<application-id>.yaml --repo=repo --force-clean --install-deps-from=flathub --ccache`

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
