const fs = require('fs')
const chalk = require('chalk')

// ganti info bot dibawah ini
global.botName = "STRV"
global.ownerName = "LECii"
global.botNumber = "628" //Ganti Nomor Kamu
global.devNumber = ["628"] // Ganti Nomor Kamu

global.Auto_Typing = false // auto typing
global.Auto_Recording = false // auto recording
global.Auto_ReadPesan = false // auto read messages

let file = require.resolve(__filename)
fs.watchFile(file, () => {
fs.unwatchFile(file)
console.log(chalk.redBright(`Update ${__filename}`))
delete require.cache[file]
require(file)
})