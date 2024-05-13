#!/bin/bash

show_menu() {
    echo "================================="
    echo "|                               |"
    echo "|   SELAMAT DATANG, Ivansyah:D  |"
    echo "|                               |"
    echo "================================="
    echo "| 1. Cek isi file               |"
    echo "| 2. Tambahkan file             |"
    echo "| 3. Hapus file                 |"
    echo "| 4. Keluar                     |"
    echo "================================="

}
    show_menu
while true; do
        read -p "Masukkan pilihan: " pilihan

    case $pilihan in
    1)  read -p "Masukkan direktori file: " file_to_read
        if [ -f "$file_to_read" ]; then
            cat $file_to_read
        else
            echo "file tidak ditemukan atau bukan merupakan file"
        fi 
        ;;
    2)  read -p "Masukkan nama file baru beserta ekstensinya: " new_file
        touch $new_file
        echo "File baru berhasil dibuat dengan nama $new_file"
        ;;
    3)  read -p "Masukkan nama file yang ingin dihapus: "  path
        rm -r $path
        ;;
    4)  echo "Sampai jumpa, Ivansyah :D"
        exit 0
        ;;
    *)
        echo "Pilihan tidak valid"
        ;;
    esac 

    echo 
    show_menu
done    