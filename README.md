# How To

## Install Flatpak Builder

`flatpak install org.flatpak.Builder`

## Clone

`git clone https://github.com/madoka773/flatpak.git --recursive`

## Build

`flatpak run org.flatpak.Builder --repo=repo --force-clean build-dir manifests/<app-id>/<app-id>.yaml`

## Add Repo

`flatpak --user remote-add --no-gpg-verify local repo`

## Install

`flatpak --user install local <app-id>`

## Update

`flatpak update`

## Remove

`flatpak remove <app-id> -y`

## Remove Repo

`flatpak remote-delete local -y`
