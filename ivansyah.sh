#!/bin/bash
# Nama : Ivansyah Eka Oktaviadi Santoso
# NIM : 2341720126
# Kelas : 1B
# Prodi : D-IV Teknik Informatika

show_menu() {
    echo "========================="
    echo "|                       |"
    echo "|     Selamat Datang    |"
    echo "|                       |"
    echo "========================="
    echo "| 1. Cek isi file       |"
    echo "| 2. Tambahkan file     |"
    echo "| 3. Hapus file         |"
    echo "| 4. Edit file          |"
    echo "| 5. Kalender           |"
    echo "| 6. Tambahkan folder   |"
    echo "| 7. Hapus folder       |"
    echo "| 8. Keluar             |"
    echo "========================="
}
    show_menu
while true; do      
        read -p "Masukkan pilihan: " pilihan

    case $pilihan in
    1) read -p "Masukkan nama file : " file_to_read
        if [ -f "$file_to_read" ]; then
            cat $file_to_read
        else    
            echo "file tidak ditemukan atau bukan merupakan file"
        fi
        ;;
    2) read -p "Masukkan nama file baru beserta ekstensinya : " new_file
        touch $new_file
        echo "file baru berhasil dibuat dengan nama $new_file"
        ;;
    3) read -p "Masukkan nama file yang ingin dihapus: " path
        rm -r $path
        echo "file $path berhasil dihapus"
        ;;
    4) read -p "Masukkan nama file yang ingin diedit: " file_to_edit
        if [ -f "$file_to_edit" ]; then 
            nano "$file_to_edit"  
        else    
            echo "Hmm.., file yang kamu cari tidak ada"
        fi
        ;;
    5) echo "Kalender saat ini :"
        cal
        ;;
    6) read -p "Masukkan nama folder yang ingin dibuat: " folder_name
        mkdir "$folder_name"
        echo "folder $folder_name berhasil dibuat"
        ;;

    7) read -p "Masukkan nama folder yang ingin dihapus: " folder_to_delete
        if [ -d "$folder_to_delete" ]; then   
            rmdir "$folder_to_delete"
            echo "Folder $folder_to_delete berhasil dihapus."
        else
            echo "Hm, folder tidak ditemukan atau bukan merupakan folder."
        fi
        ;;
    8) echo "Sampai jumpa"
     exit 0
     ;;

     *)
        echo "Pilihan tidak valid"
        ;;
    esac

    echo
    show_menu
done
