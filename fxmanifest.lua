fx_version "cerulean"
game "gta5"

description "LB Phone Billing App"
author "Simonfas"
version "1.0.0"

lua54 "yes"

client_scripts {
    "config.lua",
    "client.lua"
}

server_scripts {
    "server.lua"
}

files {
    "ui/*.html",
    "ui/*.css"
}