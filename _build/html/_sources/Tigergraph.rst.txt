Tigergraph
==========

Installation
------------

.. image:: pictures/TGLogo.png
  :width: 800
  :alt: TigerGraph Logo

Ada beberapa hal yang diperlukan sebelum menginstal sistem TigerGraph:

1.	Satu atau lebih mesin yang memenuhi persyaratan minimum perangkat keras dan perangkat lunak

2.	Super User Linux dengan nama pengguna dan kredensial login yang sama di setiap mesin

3.	License Key yang disediakan oleh TigerGraph (tidak berlaku untuk Enterprise Free)

4.	Paket sistem TigerGraph, jika belum memiliki paket sistem TigerGraph, Anda dapat memintanya

5.	Jika memasang cluster, pastikan setiap mesin memiliki port SSH yang sama dan port tetap terbuka selama instalasi


There are two ways for you to install TigerGraph which are Non-Interactive Installation and Interactive Installation.
In this case, we use Non-Interactive Installation.

Instalasi Interaktif
~~~~~~~~~~~~~~~~~~~~

Instalasi interaktif memungkinkan pengguna untuk memilih nama pengguna dan jalur file instalasi selain default.
Nama file paket Anda dapat bervariasi tergantung pada edisi dan versi produk. Untuk contoh di sini, kami menggunakan
nama file ``tigergraph-<version>.tar.gz``, yang harus diganti dengan nama file sebenarnya dari file Anda.

Step 1:  Ekstrak package TigerGraph 
+++++++++++++++++++++++++++++++++++

Ekstrak package TigerGraph ke dalam folder ``tigergraph-<version>-offline`` menggunakan command dibawah ini: 

.. code-block:: console

    $ tar -xzf tigergraph-<version>.tar.gz

Step 3: Jalankan script Instalasi
+++++++++++++++++++++++++++++++++

Navigasi ke folder ``tigergraph-<version>-offline`` dan jalankan script install.sh dengan command:

.. code-block:: console

    $ cd tigergraph-<version>-offline
    # to install enterprise license
    $ sudo ./install.sh
    
Installer akan menanyakan informasi berikut. Anda dapat memilih untuk menekan Enter untuk melewati dan menggunakan nilai-nilai default atau memasukkan nilai baru:

  #. Persetujuan Anda terhadap Syarat dan Ketentuan Lisensi
  #. Kunci lisensi Anda (tidak berlaku untuk Enterprise Free)
  #. Nama pengguna untuk pengguna Linux yang akan memiliki dan mengelola platform TigerGraph
  
    - Pemasang membuat pengguna Linux dengan nama pengguna ini yang merupakan satu-satunya pengguna resmi yang dapat menjalankan
      perintah gadmin untuk mengelola Platform TigerGraph. Jika folder instalasi dan data diubah
      dari defaultnya, pengguna yang baru dibuat harus memiliki izin yang sesuai untuk folder ini. Folder instalasi memerlukan akses baca/tulis/eksekusi,
      dan folder lain memerlukan akses baca/tulis.

  4. Kata sandi untuk pengguna Linux yang akan memiliki dan mengelola platform TigerGraph
  #. Jalur ke tempat folder instalasi akan berada
  #. Jalur ke tempat folder data akan berada
  #. Jalur ke tempat folder log akan berada
  #. Jalur ke tempat folder temp akan berada
  #. Port SSH untuk mesin Anda

Step 3: Konfigurasikan pengaturan kluster
+++++++++++++++++++++++++++++++++++++++++

Konfigurasi klaster TigerGraph memungkinkan basis data grafik untuk dipartisi dan didistribusikan ke beberapa
node server dalam jaringan lokal. Setelah Anda menjawab pertanyaan yang dijelaskan pada langkah sebelumnya, instalasi
script akan meminta yang berikut untuk menyelesaikan konfigurasi cluster:

   #. Jumlah node di cluster Anda. Setiap node akan diberikan alias mengikuti input (m1, m2, m3, dst)
   
      * Jika ini adalah instalasi single-node, masukkan 1
   #. Alamat IP setiap node
   #. Nama pengguna dan informasi kredensial pengguna sudo
   
      * Setiap mesin di cluster harus memiliki pengguna sudo dengan nama pengguna dan kata sandi atau kunci SSH yang sama.
   #. Izin untuk mengatur sinkronisasi waktu NTP
   #. Izin untuk menetapkan aturan firewall di antara node cluster

Setelah semua pertanyaan dijawab, skrip akan melanjutkan ke instalasi seperti yang ditunjukkan pada screenshot ini:

.. image:: pictures/FinishedScirpt.png
  :width: 800
  :alt: Script Example

Step 4: Verifikasi instalasi
++++++++++++++++++++++++++++

Setelah instalasi selesai, Anda dapat beralih ke pengguna Linux yang memiliki platform (dibuat di :ref:`Langkah 2`) dengan perintah berikut:

.. code-block:: console

    $ su <username>  # default username: tigergraph

Setelah mengganti pengguna dengan benar, Anda dapat mengonfirmasi instalasi yang berhasil menggunakan ``gadmin status``.
   

Instalasi Non-Interaktif
~~~~~~~~~~~~~~~~~~~~~~~~

Step 1  : Extract the package
+++++++++++++++++++++++++++++

Ekstrak package TigerGraph ke dalam folder ``tigergraph-<version>-offline`` menggunakan command berikut : 

.. code-block:: console

    $ tar -xzf tigergraph-<version>.tar.gz

Step 2: Konfigurasi pengaturan instalasinya
+++++++++++++++++++++++++++++++++++++++++++

Konfigurasi pengaturan instalasinya melalui file ``install-conf.json`` di dalam folder ``tigergraph-<version>-offline``, 

Isi file ``install_conf.json`` seperti petunjuk di bawah ini :

.. code-block:: json

    {
        "BasicConfig": {
            "TigerGraph": {
            "Username": "tigergraph",
            "Password": "tigergraph",
            "SSHPort": 22,
            "PrivateKeyFile": "",
            "PublicKeyFile": ""
            },
            "RootDir": {
            "AppRoot": "/home/tigergraph/tigergraph/app",
            "DataRoot": "/home/tigergraph/tigergraph/data",
            "LogRoot": "/home/tigergraph/tigergraph/log",
            "TempRoot": "/home/tigergraph/tigergraph/tmp"
            },
            "License": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJJc3N1ZXIiOiJUaWdlckdyYXBoIEluYy4iLCJBdWRpZW5jZSI6IlRpZ2VyR3JhcGggRnJlZS
            IsIlN0YXJ0VGltZSI6MTYxNzM1NTgwMywiRW5kVGltZSI6MTY1MTQ4NzQwMywiSXNzdWVUaW1lIjoxNjE3MzU5NDAzLCJFZGl0aW9uIjoiRW50ZXJwcmlzZSIsIl
            ZlcnNpb24iOiJBbGwiLCJIb3N0Ijp7Ik1heENQVUNvcmUiOjEwMDAwMDAwMDAwMDAwMDAsIk1heFBoeXNpY2FsTWVtb3J5Qnl0ZXMiOjEwMDAwMDAwMDAwMDAwMD
            AsIk1heENsdXN0ZXJOb2RlTnVtYmVyIjoxMDI0fSwiVG9wb2xvZ3kiOnsiTWF4VmVydGV4TnVtYmVyIjoxMDAwMDAwMDAwMDAwMDAwLCJNYXhFZGdlTnVtYmVyIj
            oxMDAwMDAwMDAwMDAwMDAwLCJNYXhHcmFwaE51bWJlciI6MTAyNCwiTWF4VG9wb2xvZ3lCeXRlcyI6NTM2ODcwNjM3MTJ9LCJHU1QiOnsiRW5hYmxlIjp0cnVlLC
            Jab29tQ2hhcnRzTGljZW5zZSI6IntcbiAgXCJsaWNlbnNlXCI6IFwiWkNCLTRtZmk3NDRsdjogWm9vbUNoYXJ0cyBFbnRlcnByaXNlIGxpY2VuY2UgZm9yIFRpZ2
            VyR3JhcGggZm9yIG9mZmxpbmUgdXNlOyB1cGdyYWRlcyB1bnRpbDogMjAyMi0xMi0zMVwiLFxuICBcImxpY2Vuc2VLZXlcIjogXCI4Zjg2ZWQzM2Y0ZWJmYmE4YT
            I4NjlkZGUzMmYzYTMwZGI4NGEzOTgxYmEzNmZhZWZlYTMxNDhhYzY4MzkxZTlhYzUzZDU3YmI5MjdmNjY5YWI1ZWJhYzJhYmQ3YTFkNDBiM2UxNDRmZjIwMDYyZW
            NiZmIwZjJiN2I0ZWFmZWIwYzU2NTc2NjBhZGExZDc1MWNhODU3NWZhYTE1ZWQwODI0NzkwZWQxMjJkY2Q4NjcyZTJiN2QzN2MwNmE3MzFhYTc2MDIwM2FhYmMwYj
            YzOWEzMjBhOGQxNmI0YmFiNGY5NTJiNTMwOTUzMWI4MDkxNjYwZDVjOGMzNGY0NmMyNjZiOGZiNzc2YzFmN2Y0MTdlMGQ5Y2JkZGFlOTExNTFlY2Y3YmMzZDlkND
            gyNWE2MjAwYzk0MWMyMDE4ZDY4YjkyOWE5ZWY2MzQ2MDE5NjFhYmU1MGI0ZTk0ZmY5Y2VjMjA1ODEwYmVlZmRkM2NlZDU2YjM5NTVjYmE0YWIyMGNiNzc5MWE0Nm
            QxNzIwMzNiZmI0ZDIyMDM4ODZhZTllZDFkOWMzOWIyOTM2ODc3Yjc2NzY4ZjQwNWQ5Y2MwY2JlODVjOTE2NDllMDI5YTA0NDFlOGFmYjA2MzY4MTMxZGM1YTc1ND
            EyOTc1NjFlMDRlMGM1MzE1ZmFjMDdhYzViOWViM1wiXG59In0sIlJ1bnRpbWVNZW1vcnkiOnsiTWF4VXNlclJlc2lkZW50U2V0Qnl0ZXMiOjEwMDAwMDAwMDAwMD
            AwMDB9fQ.B1tR-ZyzFB3WCtCXBl-CXb-3YlL1Hy1btCzsEnkLd6GE2AOvJdpqVZGU-YGyIaOGSYX1sbjrePBoupuWPwrOgvce-mq_Qwp8eounoEOkuzYlTQXFj3l
            M1wO6vrdiOn2GUm0qMVtlVTIDrFZlZ-bWcdSUA4J8t2JNJrYxQgPWjlO9f4I4w2RbTK3sZW7N96bqFUQPituiwLcPX_VSVT8KBluM2WIH7CJitHl21IbnQbwScBw
            _QgjfaITZXE6UXisMM9XNphf5yQX9arFDQLchV7e2i3R2tUEuF7V_mHFrVa8vCBjm_0uABzcY8U02QJ78SB9MgLNrqgtzIwHmYP22KQ",
            "NodeList": [
            "m1: 127.0.0.1"
            ]
        },
        "AdvancedConfig": {
            "ClusterConfig": {
            "LoginConfig": {
                "SudoUser": "sudoUserName",
                "Method": "P[or K]",
                "P": "<sudo_user_password>",
                "K": "</path/to/my_key.pem_rsa>"
            },
            "ReplicationFactor": 1
            }
        }
    }

Deskripsi masing-masing key dari config file di atas adalah sebagai berikut :

* ``"BasicConfig"``

  * ``"TigerGraph"`` : Informasi tentang User Linux yang akan dibuat oleh installer dan nantinya akan menjadi pemilik dan pengelola platform TigerGraph

    * ``"UserName"`` : Username dari user Linux.
    * ``"Password"`` : Password dari user Linux.
    * ``"SSHPort"``  : Port yang digunakan untuk membuat koneksi SSH.
    * ``"PrivateKeyFile"`` (Opsional) : Lokasi file private key. Jika kosong, TigerGraph akan otomatis membuat file dengan nama ```tigergraph.rsa``.
    * ``"PublicKeyFile"`` (Opsional) : Lokasi file public key. Jika kosong, TigerGraph akan otomatis membuat file dengan nama  ``tigergraph.pub``.

  * ``"RootDir"``
    * ``"AppRoot"`` : Lokasi folder aplikasi berada..
    * ``"DataRoot"`` : Lokasi folder data berada.
    * ``"LogRoot"``  : Lokasi folder log berada.
    * ``"TempRoot"`` : Lokasi folder temp berada.

  * ``"License"`` : Lisensi TigerGraph yang akan diinstall.
  * ``"Node List"`` : Array JSON dari setiap node dalam cluster, dengan <key>-nya adalah nama alias dari setiap mesin dan <value> diisi dengan alamat IP dari setiap mesin. 

* ``"AdvancedConfig"``

  * ``"ClusterConfig"`` : Konfigurasi Cluster

    * ``"LoginConfig"`` : Konfigurasi Login

      * ``"SudoUser"`` : Username dari sudo user yang akan melakukan penginstalan di semua node.
      * ``"Method"``  : Metode otentikasi untuk SSH. Isi ``"P"`` untuk menggunakan password authentication atau ``"K"`` untuk menggunakan key-based authentication. Jika menggunakan key-based authentication, sudo user harus bersifat password-less sudo access di semua node di cluster.
      * ``"P"`` : Password dari sudo user.
      * ``"K"`` : Lokasi SSH key yang akan digunakan untuk otentikasi sudo user.

    * ``"ReplicationFactor"`` : Faktor Replikasi dari cluster.

      * Jika semisalnya ingin mengaktifkan fitur High Availability (HA), pastikan minimal ada 3 node di dalam cluster dan set nilai ReplicationFactor lebih besar dari 1. Contoh, jika memiliki 6 node di dalam cluster, set nilai ReplicationFactor menjadi 2 atau  3. Semisalkan 2, maka faktor partisinya menjadi 6 / 2 = 3 , di mana 3 node akan digunakan untuk satu salinan data, dan 3 node lainnya akan digunakan sebagai salinan replika data.
      * Jumlah node harus habis dibagi nilai ReplicationFactor, jika tidak maka beberapa node tidak dapat digunakan sebagai bagian dari cluster HA.

Step 3: Jalankan script 
+++++++++++++++++++++++

Jalankan script install.sh dengan flag -n seperti kode dibawah untuk meng-install TigerGraph dan tunggu beberapa saat.

.. code-block:: console
  
  $ sudo ./install.sh -n


