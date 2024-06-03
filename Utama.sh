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
    echo "| 5. Pindah file/folder |"
    echo "| 6. Kalender           |"
    echo "| 7. Tambahkan folder   |"
    echo "| 8. Hapus folder       |"
    echo "| 9. Zip File           |"
    echo "|10. Unzip File         |"       
    echo "|11. Keluar             |"
    echo "========================="
}

cek_file() {
read -p "Masukkan nama file : " file_to_read
        if [ -f "$file_to_read" ]; then
            cat $file_to_read
        else    
            echo "file tidak ditemukan atau bukan merupakan file"
        fi
        
}
tambahkan_file() {
    read -p "Masukkan nama file baru beserta ekstensinya : " new_file
        touch $new_file
        echo "file baru berhasil dibuat dengan nama $new_file"
}
hapus_file() {
read -p "Masukkan nama file yang ingin dihapus: " path
        rm -r $path
        echo "file $path berhasil dihapus"
}
edit_file() {
     read -p "Masukkan nama file yang ingin diedit: " file_to_edit
        if [ -f "$file_to_edit" ]; then 
            nano "$file_to_edit"  
        else    
            echo "Hmm.., file yang kamu cari tidak ada"
        fi
}
pindah_file() {
    read -p "Masukkan nama file yang ingin dipindahkan: " source_path
    read -p "Masukkan tujuan folder: " dest_folder

    if [ ! -d "$dest_folder" ]; then
        echo "Tujuan yang Anda masukkan bukan direktori yang valid."
        return
    fi
    echo "Pilih metode pemindahan:"
    echo "1. Potong (cut)"
    echo "2. Salin (copy)"
    read -p "Masukkan pilihan (1/2): " move_method

    case $move_method in
        1) mv "$source_path" "$dest_folder"
            echo "File atau folder $source_path telah dipindahkan (potong) ke $dest_folder"
            ;;
        2) cp -r "$source_path" "$dest_folder"
            echo "File atau Folder $source_path telah disalin (copy) ke $dest_folder"
            ;;
        *) echo "Pilihan tidak valid.";;
        esac
}
tampil_kalender() {
    echo "Kalender saat ini :"
     cal
}
tambahkan_folder() {
    read -p "Masukkan nama folder yang ingin dibuat: " folder_name
        mkdir "$folder_name"
        echo "folder $folder_name berhasil dibuat"
}
hapus_folder() {
     read -p "Masukkan nama folder yang ingin dihapus: " folder_to_delete
        if [ -d "$folder_to_delete" ]; then   
            rmdir "$folder_to_delete"
            echo "Folder $folder_to_delete berhasil dihapus."
        else
            echo "Hm, folder tidak ditemukan atau bukan merupakan folder."
        fi
}
zip_file() {
    read -p "Masukkan nama file beserta ekstensinya yang ingin di-zip: " file_name
    read -p "Masukkan nama file zip yang diinginkan: " zip_name

    zip "$zip_name" "$file_name"

    echo "Apakah ingin memberi password pada file zip? (y/n):"
    read give_password

    if [ "$give_password" = "y" ]; then   
        echo "Masukkan password untuk file zip:"
        read -s zip_password
        echo
        zip -e --password "$zip_password" "$zip_name.zip" "$file_name"
        echo "File $file_name telah di-zip menjadi $zip_name.zip dengan password."
    else    
        echo "File $file_name telah di-zip menjadi $zip_name.zip tanpa password."
    fi
}

unzip_file() {
    echo "Masukkan nama file zip tanpa eksistensinya yang ingin di-unzip: "
    read zip_name
    mkdir -p "$zip_name"  # Membuat folder dengan nama file zip
    unzip "$zip_name.zip" -d "$zip_name"
    if [ $? -ne 0 ]; then
        read -s -p "Mungkin file zip memerlukan password. Masukkan password untuk ekstraksi: " zip_password
        echo
        unzip -P "$zip_password" "$zip_name.zip" -d "$zip_name"
    fi
    echo "File $zip_name.zip telah diunzip ke folder $zip_name"
}

keluar() {
    echo "Sampai jumpa"
    exit 0
}

while true; do      
    show_menu
        read -p "Masukkan pilihan: " pilihan
    case $pilihan in
    1) cek_file ;;
    2) tambahkan_file ;;
    3) hapus_file ;;
    4) edit_file ;;
    5) pindah_file;;
    6) tampil_kalender;;
    7) tambahkan_folder;;
    8) hapus_folder;;
    9) zip_file;;
    10) unzip_file;;
    11) keluar;;
    *) echo "Pilihan tidak valid";;

    esac
done