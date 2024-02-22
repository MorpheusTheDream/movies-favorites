<template>
  <div class="aboutBuild">
    <div id="special" class="miniBox">
      <h1>About Me </h1>
      <p>
        Hai semuanya nama saya Eric, saya adalah seorang web developer(sedang mencoba ^_^). Situs ini adalah project saya dimana pengguna dapat mencari film yang sedang ingin dicari/diminati serta pengguna bisa menyimpan film-film di favorite list dan memberi nilai pada film tersebut. Saya membuat situs ini dengan menggunakan beberapa aplikasi dan bahasa pemrograman di bawah ini.
      </p>
    </div>

    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/HTML5.png"> 
      </div>

      <h1>HTML</h1>
      <p>HyperText Markup Language (HTML) adalah bahasa markah standar untuk dokumen yang dirancang untuk ditampilkan di peramban internet. Ini dapat dibantu oleh teknologi seperti Cascading Style Sheets (CSS) dan bahasa skrip lainnya seperti JavaScript, VBScript, dan PHP.</p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/CSS.png">
      </div>
      <h1>CSS</h1>
        <p>
          Cascading Style Sheet (CSS) merupakan aturan untuk mengatur beberapa komponen dalam sebuah web sehingga akan lebih terstruktur dan seragam. CSS bukan merupakan bahasa pemrograman.
        </p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/JS.webp">
      </div>
      <h1>JavaScript</h1>
        <p>
          JavaScript adalah suatu bahasa pemrograman tingkat tinggi dan dinamis. JavaScript populer di internet dan dapat bekerja di sebagian besar penjelajah web populer seperti Google Chrome, Internet Explorer, Mozilla Firefox, Netscape dan Opera. Kode JavaScript dapat disisipkan dalam halaman web menggunakan tag script.
        </p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/Vue-js.png">
      </div>
      <h1>Vue.js</h1>
        <p>Vue.js (biasa disebut sebagai Vue; diucapkan /vjuː/, seperti view) adalah kerangka kerja JavaScript yang bersifat progresif, bersumber terbuka untuk membangun antarmuka pengguna. Integrasi ke dalam proyek yang menggunakan pustaka JavaScript lainnya mudah dilakukan dengan Vue karena ia dirancang untuk bisa berjalan hanya di beberapa bagian halaman web. Vue juga bisa berfungsi sebagai kerangka kerja aplikasi web yang mampu menjalankan aplikasi single-page yang canggih. Dengan menggunakan kerangka kerja Nuxt.js, Vue.js dapat direpresentasikan secara dini dari sisi server atau biasa disebut server side rendering.</p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/Php.png">
      </div>
      <h1>PHP</h1>
        <p>PHP: Hypertext Preprocessor atau hanya PHP saja, adalah bahasa skrip dengan fungsi umum yang terutama digunakan untuk pengembangan web. Bahasa ini awalnya dibuat oleh seorang pemrogram Denmark-Kanada Rasmus Lerdorf pada tahun 1994. Implementasi referensi PHP sekarang diproduksi oleh The PHP Group.</p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/mysql.png">
      </div>
      <h1>MySQL</h1>
        <p>MySQL adalah sebuah perangkat lunak sistem manajemen basis data SQL (bahasa Inggris: database management system) atau DBMS yang multialur, multipengguna, dengan sekitar 6 juta instalasi di seluruh dunia. MySQL AB membuat MySQL tersedia sebagai perangkat lunak gratis di bawah lisensi GNU General Public License (GPL), tetapi mereka juga menjual di bawah lisensi komersial untuk kasus-kasus di mana penggunaannya tidak cocok dengan penggunaan GPL.</p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/Visual Studio Code.webp">
      </div>
      <h1>Visual Studio Code</h1>
        <p>Visual Studio Code (disingkat VCode) adalah perangkat lunak penyunting kode-sumber buatan Microsoft untuk Linux, macOS, dan Windows. Visual Studio Code menyediakan fitur seperti penyorotan sintaksis, penyelesaian kode, kutipan kode, merefaktor kode, pengawakutuan, dan Git. Microsoft merilis sumber kode Visual Studio Code di repositori GitHub dengan lisensi MIT,sedangkan biner yang dibangun oleh Microsoft tidak dirilis dengan lisensi MIT dan merupakan perangkat lunak berpemilik.</p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/Laragon.jpg">
      </div>
      <h1>Laragon</h1>
        <p>Laragon adalah perangkat lunak yang digunakan untuk membuat server web lokal di komputer. Dengan Laragon, Anda dapat membuat dan menguji website tanpa perlu menghubungkannya ke internet. Laragon memiliki beberapa keunggulan dibandingkan XAMPP, antara lain: Lebih ringan dan cepat.</p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/MySQL Workbench.png">
      </div>
      <h1>MySQL Workbench</h1>
        <p>MySQL Workbench adalah sebuah perangkat aplikasi berbentuk visual yang dipergunakan untuk mengelola basis data. Perangkat aplikasi ini biasa digunakan oleh seorang arsitek basis data, pengembang basis data, serta administator basis data. MySQL Workbench menyediakan model data, pengembangan SQL, dan peralatan administrasi yang komperhensif untuk konfigurasi server basis data, administrasi pengguna, dan masih banyak lagi. MySQL Workbench tersedia pada platform Windows, Linux dan Mac OS.</p>
    </div>
    <div class="miniBox">
      <div class="imgBox">
        <img src="@/assets/icon/Axios.jpg">
      </div>
      <h1>Axios</h1>
        <p>Axios merupakan sebuah library yang berguna untuk melakukan proses HTTP request pada website. Axios dapat memudahkan kamu pada saat mengelola interaksi antara client dan server.</p>
    </div>
  </div>

</template>

<script>
export default {

}
</script>

<style scoped>

.aboutBuild {
  margin-top: 4em;
  
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

#special  {
  width: 95%;
}

.miniBox {
  border-radius: 10px;
  padding: 1.5em;
  box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
  background-color: white;
  width: 45%;

  margin: 0 .5em 1em;
  box-sizing: border-box;
}

.miniBox h1 {
  text-align: center;
  font-size: 1.2rem;
}

.miniBox p {
  color: black;
  text-align: justify;
}

.imgBox {
  width: 80px;
  height: 80px;
  margin: 0 auto;
  overflow: hidden;
}


.imgBox img {
  display: block;
  margin: 0 auto;

  object-fit: cover;
  width: 90%;
}

@media screen and ( max-width: 900px) {

.aboutBuild {
  display: block;
}

.miniBox {
  width: 90%;
  margin: 0 auto 1em;
}

.miniBox h1 {
  font-size: 1rem;
}

.miniBox p {
  font-size: .9rem;
}

}

</style>