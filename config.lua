Config = {}

Config.debug = false

Config.name = "Regninger" -- Name of the App
Config.description = "Se og betal dine regninger" -- disc in the appstore (edit for your local)
Config.defaultApp = true -- OPTIONAL if set to true, app should be added without having to download it,
Config.size = 512  -- OPTIONAL in kb
Config.price = 0 -- OPTIONAL, Make players pay with in-game money to download the app. Do 0 for it to be free.
Config.developer = "Simonfas" -- OPTIONAL, Developer name shown in the appstore, if not set it will default to "Simonfas"

Config.images = {
    "https://cdn-icons-png.flaticon.com/512/2331/2331941.png" -- Image shown in the appstore and on the phone when the app is downloaded
}

Config.icon = "https://cdn-icons-png.flaticon.com/512/2331/2331941.png" -- Icon shown on the phone when the app is downloaded, if not set it will default to the first image in the Config.images table