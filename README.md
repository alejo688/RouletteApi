# RouletteApi
Prueba desarrollo backend .Net Masivian

La base de datos fue desarrollada en SQL Server, adjunto en la carpeta ScriptDataBase estara el script de la base de datos de la api.

Para la invocación de los servicios de las api se haria de la siguiente manera:

- Creación de ruleta: https://localhost:44331/api/Roulette/CreateRoulette/{ApiKey}

- Activación de ruleta: https://localhost:44331/api/Roulette/ActivateRoulette/{ApiKey}/{IdRuleta}

- Apostar: https://localhost:44331/api/Roulette/BetRoulette/{ApiKey}/{IdRuleta}/{Numero}/{Color}/{Apuesta}

- Cerrar ruleta: https://localhost:44331/api/Roulette/CloseRoulette/{ApiKey}/{IdRuleta}

- Listado de ruletas: https://localhost:44331/api/Roulette/ListRoulette/{ApiKey}

Las ApiKey de pruebas son las siguientes:

ApiKey Crupier: 43fDS45ga67YTc3&ds43
ApiKey Apostador 1: SD546FS3WQ342
ApiKey Apostador 2: DFw2213dsad34f
ApiKey Apostador 3: Tr54aSf26#@fasf
