#!/bin/bash
LAST_VERSION=$(curl -sX 'GET' 'https://api.papermc.io/v2/projects/paper' -H 'accept: application/json' | jq .versions[-1] | sed 's/"//g')
LAST_BUILD=$(curl -sX 'GET' "https://api.papermc.io/v2/projects/paper/versions/${LAST_VERSION}" -H 'accept: application/json' | jq .builds[-1])
DOWNLOAD_FILE=$(curl -sX 'GET' "https://api.papermc.io/v2/projects/paper/versions/${LAST_VERSION}/builds/${LAST_BUILD}" -H 'accept: application/json' | jq .downloads.application.name | sed 's/"//g')
wget -O paper.jar "https://api.papermc.io/v2/projects/paper/versions/${LAST_VERSION}/builds/${LAST_BUILD}/downloads/${DOWNLOAD_FILE}"
mkdir ./plugins
wget -O ./plugins/worldedit.jar "https://dev.bukkit.org/projects/worldedit/files/latest"
wget -O ./plugins/worldguard.jar "https://dev.bukkit.org/projects/worldguard/files/latest"
wget -O ./plugins/craftbook.jar "https://dev.bukkit.org/projects/craftbook/files/latest"
wget -O ./plugins/simplevoicechat.jar "https://dev.bukkit.org/projects/simple-voice-chat/files/latest"
wget -O ./plugins/multiverse-core.jar "https://dev.bukkit.org/projects/multiverse-core/files/latest"
wget -O ./plugins/multiverse-portals.jar "https://dev.bukkit.org/projects/multiverse-portals/files/latest"
wget -O ./plugins/multiverse-inventories.jar "https://dev.bukkit.org/projects/multiverse-inventories/files/latest"
wget -O ./plugins/essentialsx.jar "https://dev.bukkit.org/projects/essentialsx/files/latest"
wget -O ./plugins/luckperms.jar "https://download.luckperms.net/1491/bukkit/loader/LuckPerms-Bukkit-5.4.79.jar"
mkdir ./plugins/Multiverse-Core
mkdir ./plugins/LuckPerms
