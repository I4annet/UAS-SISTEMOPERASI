#!/bin/bash
    echo "================================="
    echo "|                               |"
    echo "|   SELAMAT DATANG, Ivansyah:D  |"
    echo "|                               |"
    echo "================================="
    echo "| 1. Lihat file                 |"
    echo "| 2. Tambahkan file             |"
    echo "================================="
    read -p "Masukkan pilihan: " pilihan

    case $pilihan in
    1)
        read -p "Masukkan direktori file: " dir
        ls $dir
        echo "File ditemukan :D"
        ;;
    2) read -p "Masukkan nama file baru beserta ekstensinya: " new_file
        touch $new_file
        echo "File baru berhasil dibuat dengan nama $new_file"
        ;;
    *)
        echo "Pilihan tidak valid"
        ;;
    esac 