fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'A FiveM resource that looks up civilian data from Community CAD API and displays it in a UI.'
version '1.0.0'

client_scripts {
    'client.lua',
    'config.lua'
}
server_scripts {
    'server.lua',
    'config.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}
