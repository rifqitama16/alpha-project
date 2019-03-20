AlphaProject: SSH login attempts counter
========================================

### Apa Itu AlphaProject?
Merupakan utilitas client-server sederhana yang berfungsi sebagai penghitung jumlah percobaan login SSH. Utilitas ini terdiri dari 2 bagian, yaitu AlphaClient (client.sh) dan AlphaServer (server.sh). Informasi yang ditampilkan disortir berdasarkan hostname.

### Bagaimana Cara Kerjanya?
AlphaClient akan bekerja tiap kali muncul baris baru di /var/log/auth.log (didefinisikan sebagai variabel `AC_INPUT`) yang menginformasikan bahwa telah terjadi percobaan login SSH yang gagal maupun yang berhasil. Selanjutnya, data tersebut dikirim secara langsung ke server tujuan dengan membawa informasi waktu kejadian dan hostname client dengan path tujuan didefinisikan oleh variabel `AC_OUTPUT`. Di sisi server, informasi yang telah diterima (`AS_INPUT`) akan langsung dilakukan pengelompokan data berdasarkan hostname tiap 5 detik yang disimpan di `AS_OUTPUT`.

### Prasyarat
* SSH Passwordless dari client ke server
* Root web directory di server telah disesuaikan
* File output.log dan report.txt yang ada di server telah dibuat terlebih dahulu

### Instalasi
* Simpan client.sh di client begitupun server.sh di server
* Sesuaikan variabel yang ada pada client.sh
  * `AC_INPUT` : Lokasi file auth.log
  * `AC_UNAME` : Username server
  * `AC_IPADD` : IP address server
  * `AC_OUTPUT` : Lokasi yang menjadi file tujuan pengiriman data ke server
* Sesuaikan variabel yang ada pada server.sh
  * `AS_INPUT` : Merujuk ke file yang sama dengan `AC_OUTPUT`
  * `AS_OUTPUT` : Lokasi tujuan yang nantinya akan ditampilkan oleh web server
  
Untuk memudahkan instalasi, disertai pula file playbook Ansible (`playbook.yml`). Beberapa hal yang harus diubah adalah path serta server dan client target yang disesuaikan dengan file hosts.
