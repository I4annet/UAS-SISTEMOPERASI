#!/bin/bash
# Nama : Ivansyah Eka Oktaviadi Santoso
# NIM : 2341720126
# Kelas : 1B
# Prodi : D-IV Teknik Informatika

show_initial_menu() {
    echo "====================="
    echo "|  Selamat Datang   |"
    echo "====================="
    echo "| 1. Rendah         |"
    echo "| 2. Sedang         |"
    echo "| 3. Tinggi         |"
    echo "====================="
}

show_initial_menu
read -p "Masukkan pilihan tingkat: " tingkat

case $tingkat in
    1)
        bash rendah.sh
        ;;
    2)
        bash sedang.sh
        ;;
    3)
        bash tinggi.sh
        ;;
    *)
        echo "Pilihan tidak valid. Silahkan coba lagi."
        ;;
esac