#!/bin/bash
clear
session_dir="servers/session"
node_modules_dir="/data/data/com.termux/files/usr/bug6/node_modules"
tools_dir="$HOME/TOOLSV5/sound"

if [ -d "$session_dir" ]; then
    read -p "Anda Ingin Login Ke Nomor Baru Bot Atau Tidak? Jawab (ya/no): " response
    if [[ "$response" == "no" || "$response" == "n" ]]; then
        clear
    elif [[ "$response" == "ya" || "$response" == "y" ]]; then
        rm -rf "$session_dir"
        clear
        echo "Succes Bot Bisa Di Loginkan Ke Nomor Yang Baru!"
        sleep 5
        clear
    fi
fi
while true; do
    if [ -d "$node_modules_dir" ]; then
        while true; do
            clear
            play -q "$tools_dir/robot2.mp3" &>/dev/null
            echo "BOT DI JALANKAN 24 JAM UNTUK BERHENTI CTRL+C"
            echo "TUNGGU 10 DETIK"
            sleep 10
            play -q "$tools_dir/klik.mp3" &>/dev/null
            npm start
        done
    else
        clear
        play -q "$tools_dir/salah.mp3" &>/dev/null
        echo "Node_Modules Belum Terinstall"
        sleep 5
        clear
        echo "Menginstall Node_Modules"
        echo
        sleep 3
        pkg update && pkg upgrade -y
        pkg install bash libwebp git nodejs -y
        pkg install ffmpeg wget imagemagick -y
        if ! command -v yarn &> /dev/null; then
            npm install -g yarn
        fi
        yarn install
    fi
done
