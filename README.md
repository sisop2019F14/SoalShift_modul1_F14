# SoalShift_modul1_F14
SOAL 1

Setelah mendownload file nature.zip, buat folder baru bernama nature untuk menaruh hasil extract file nature.zip dan hasil decode dari file didalamnya. Lalu buat file bernama encrypt.sh dengan perintah nano encrypt.sh
![whatsapp image 2019-02-20 at 13 18 35](https://user-images.githubusercontent.com/47809366/53141292-21e39000-35c2-11e9-86a2-efb2cdc6ab24.jpeg)

Lalu isi file encrypt.sh

![whatsapp image 2019-02-20 at 13 18 35 1](https://user-images.githubusercontent.com/47809366/53218697-bb2ca800-368f-11e9-97ed-f90776a4f675.jpeg)


unzip nature.zip cd nature/ adalah script untuk meng-extract file nature.zip dan dimasukan kedalam folder nature.
Name=”extracted” adalah script untuk mendefinisikan variable Name dengan isi string “extracted”
For i in *.jpg; do ….. done adalah script pengulangan untuk mencari file bertipe .jpg
Newfile = “$name$i” base65 –d $i | xxd –r > $newfile adalah script untuk mendecode file yang telah dienkripsi, lalu file yang telah didecode diberi nama “extracted”-namafile.jpg.
lalu atur crontab:

![crontab1](https://user-images.githubusercontent.com/47809366/53636677-9ae28780-3c53-11e9-8a42-437913fefdd7.PNG)

Hasil:
![whatsapp image 2019-02-20 at 13 18 34](https://user-images.githubusercontent.com/47809366/53218731-db5c6700-368f-11e9-9566-3f6a9f52dedc.jpeg)

SOAL 2a

![whatsapp image 2019-02-20 at 13 37 59](https://user-images.githubusercontent.com/47809366/53218924-a3095880-3690-11e9-8d38-919e4efe478d.jpeg)

Awk, -F, { if(/2012/){a[$1]+=$10;} } adalah script untuk mencari string “2012” pada setiap baris pada tabel (a sebagai variable kolom pertama).
END{ max=0; for( key in a) { if(max < a[key]) { max=a[key] idx=key } } print “ Yang terbanyak adalah” print idx }’ WA_Sales_Products_2012-14.csv adalah script untuk mencari nilai maksimum penjualan dari masing-masing negara lalu me-print hasilnya. 

![whatsapp image 2019-02-20 at 13 37 59 1](https://user-images.githubusercontent.com/47809366/53218985-e06de600-3690-11e9-96df-b39a87be9698.jpeg)

SOAL 2b

![whatsapp image 2019-02-20 at 13 38 01](https://user-images.githubusercontent.com/47809366/53219019-072c1c80-3691-11e9-8671-2c2be64b671e.jpeg)

Karena soal keduaB adalah mencari product line yang memiliki penjualan terbanyak dari negara yang memiliki penjualan terbanyak(united states) maka, diberikan syarat dalam melakukan looping dimana kata kunci yang dicari berada pada kolom 4 (product line)  dengan kolom 1 bernilai string united states dan kolom 7 bernilai string2012 . Lalu inisiasikan variable p1, p2 dan p3 dengan nilai 0 dan lalukan looping untuk mencari nilai max dari masing-masing product line, nilai max dimasukan ke dalam idx1, idx2 dan idx3 lalu di print.
![whatsapp image 2019-02-20 at 13 38 00](https://user-images.githubusercontent.com/47809366/53219192-aa7d3180-3691-11e9-8669-8a59fa60accd.jpeg)

SOAL 2c

![no2cpart1](https://user-images.githubusercontent.com/47809366/53636552-34f60000-3c53-11e9-81c2-db3ddae88d00.png)

![no2cpart2](https://user-images.githubusercontent.com/47809366/53636565-3e7f6800-3c53-11e9-8bc2-75c165c8a819.png)

![no2cpart3](https://user-images.githubusercontent.com/47809366/53636568-40492b80-3c53-11e9-9f5e-58353ecc59ed.png)

Karena soal keduaC adalah mencari product yang memiliki penjualan terbanyak dari produk line dan negara yang memiliki penjualan terbanyak(united states) maka, diberikan syarat dimana kata kunci yang dicari berada pada kolom 6(product line)  dengan kolom 4 bernilai string Personal accessories, camping equipment, dan outdoor protection (dari soal nomer 2b) 

![hasil](https://user-images.githubusercontent.com/47809366/53636626-74bce780-3c53-11e9-85ed-8e1dd41db1b1.png)

SOAL 3

![whatsapp image 2019-02-20 at 13 18 33](https://user-images.githubusercontent.com/47809366/53219171-90435380-3691-11e9-8247-07b2789c6d7f.jpeg)

Looping digunakan untuk mencari apakah file bernama password(angka).txt ada atau tidak, jika ada maka variable flag ditandai dengan 1 lalu looping di break, jika tidak ada flag ditandai dengan 0 dan masuk pada kondisi kedua dimana perintah untuk membuat file password dibuat. Head /dev/urandom | tr –dc A-Za-z0-9 | head –c 12 > “$namafile” berguna untuk memberikan syarat karakter berjumlah 12 karakter, dan berisi huruf capital dan huruf kecil serta angka 0-9.

SOAL 4

file encrypt:

![no4encrypt1](https://user-images.githubusercontent.com/47809366/53219303-09db4180-3692-11e9-9639-a17d70b91020.png)
64806.png)
![no4encrypt2](https://user-images.githubusercontent.com/47809366/53219316-165f9a00-3692-11e9-9aaa-0534f8509db1.png)

Pada script enkripsi, pertama adalah mengambil waktu saat ini (jam nya saja), setelah itu menentukan jam menit tanggal untuk menamai file, dari waktu yang diambil tentukan batas bawah dan batas atas (berupa ASCII) dan ubah menjadi char dan. Lalu setelah itu masukkan ke dalam folder yang sudah ditentukan dan lakukan enkripsi.

file decrypt:


![no4decrypt3](https://user-images.githubusercontent.com/47809366/53219296-03e56080-3692-11e9-97c8-a2699639e465.png)

Pada file descrypt, ambil waktu (jam) untuk menamai file, ambil batas bawah dan batas atas lalu ubah menjadi char, lalu simpan hasil decrypt pada file .txt

Crontab:

![no4decrypt1](https://user-images.githubusercontent.com/47809366/53219607-32177000-3693-11e9-8ce0-880ae240904f.png)

![no4decrypt2](https://user-images.githubusercontent.com/47809366/53219611-35126080-3693-11e9-9abd-e9c59d216008.png)

![crontab4](https://user-images.githubusercontent.com/47809366/53219493-b7e6eb80-3692-11e9-8a89-b5bea04409fa.PNG)

SOAL 5

![no5script](https://user-images.githubusercontent.com/47809366/53219403-63437080-3692-11e9-8ae7-10f825ecae22.png)

Mengubah isi file menjadi huruf kecil, lalu filter dengan mencari string cron dan tidak mengantuk string sudo. Lalu ambil yang jumlah field nya tidak melebihi 13 field. Lalu simpan file logs kedalam direktori yang dituju

crontab:

![crontab5](https://user-images.githubusercontent.com/47809366/53219459-9ab21d00-3692-11e9-8e6b-7624e16a1c55.PNG)
