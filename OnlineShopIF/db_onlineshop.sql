-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2019 at 04:22 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_onlineshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `idadmin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idadmin`, `username`, `password`, `namalengkap`) VALUES
(1, 'admin', 'admin', 'Administrator IFManggaleh.com');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `idanggota` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` char(1) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `alamat` text NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `foto` text NOT NULL,
  `tgldaftar` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idanggota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`idanggota`, `email`, `password`, `nama`, `jk`, `tgllahir`, `alamat`, `nohp`, `foto`, `tgldaftar`) VALUES
(1, 'anggotabaru@gmail.com', '123456', 'Anggota IFManggaleh.com', 'L', '1995-03-17', 'Jl. Raya Lubuk Begalung Padang, Sumatera Barat', '081234567890', 'me.jpg', '2019-12-20 14:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `idproduk` int(11) NOT NULL,
  `idanggota` int(11) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `tglcart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idcart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cart`
--


-- --------------------------------------------------------

--
-- Table structure for table `jasakirim`
--

CREATE TABLE IF NOT EXISTS `jasakirim` (
  `idjasa` int(11) NOT NULL AUTO_INCREMENT,
  `idadmin` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `logo` text NOT NULL,
  `detail` text NOT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`idjasa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jasakirim`
--

INSERT INTO `jasakirim` (`idjasa`, `idadmin`, `nama`, `logo`, `detail`, `tarif`) VALUES
(1, 1, 'JNE', 'jne.jpg', 'Perusahaan yang berdiri sejak 1990 ini menawarkan 4 jenis layanan pengiriman barang, antara lain OKE (Ongkos Kirim Ekonomis), REG (Reguler), YES (Yakin Esok Sampai), dan SS (Super Speed)', 13000),
(2, 1, 'POS INDONESIA', 'pos.jpg', 'Kini untuk jasa pengiriman barang, PT Pos Indonesia menawarkan beberapa jenis layanan, diantaranya adalah Surat Kilat Khusus dan Express Next Day', 11000),
(3, 1, 'TIKI', 'tiki.jpg', 'Perusahaan jasa pengiriman barang ini menawarkan 5 jenis layanan pengiriman barang, antara lain ECO (Economi Service), REG (Reguler Service), ONS (Over Night Service), HDS (Holiday Delivery Service), dan SDS (Same Day Service)', 12500),
(4, 1, 'PANDU LOGISTIC', 'pandu.jpg', 'Perusahaan ini menawarkan 2 jenis layanan jasa pengiriman, yakni Overnight Service dan Same Day Service', 15000),
(5, 1, 'RPX HOLDING', 'rpx.jpg', 'Perusahaan yang memiliki kantor pusat di bilangan Jakarta Selatan ini menawarkan 5 jenis layanan jasa pengiriman, antara lain SameDay Package, MidDay Package, Next Day Package, Regular Package, dan Retail Package', 12000),
(6, 1, 'ESL EXPRESS', 'esl.jpg', 'ESL Express menawarkan berbagai jenis layanan jasa pengiriman. Salah satunya adalah DARAT dengan jenis kiriman RPX â€“ Paket (0,01-99,00 kg)', 14500);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `idkat` int(11) NOT NULL AUTO_INCREMENT,
  `idadmin` int(11) NOT NULL,
  `namakat` varchar(40) NOT NULL,
  `ketkat` text NOT NULL,
  `tglkat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idkat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkat`, `idadmin`, `namakat`, `ketkat`, `tglkat`) VALUES
(1, 1, 'Handphone', 'Semua yang berhubungan dengan Handphone dan Smartphone', '2019-10-26 15:26:28'),
(2, 1, 'Televisi', 'Semua produk televisi berbagai merk bisa dilihat disini. ', '2019-10-26 15:57:15'),
(3, 1, 'Notebook', 'Semua Notebook dengan berbagai merk dan ukuran bisa ditemukan disini', '2019-10-26 20:43:31'),
(4, 1, 'Kulkas', 'Semua tipe kulkas dan merk kulkas bisa ditemukan disini', '2019-10-26 23:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE IF NOT EXISTS `orderdetail` (
  `idorder` int(11) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `idjasa` int(11) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`idorder`, `idproduk`, `idjasa`, `jumlahbeli`, `subtotal`) VALUES
(1, 5, 1, 1, 3697500),
(1, 6, 1, 1, 4639500),
(2, 3, 1, 1, 2733900),
(4, 1, 2, 2, 3300000),
(5, 1, 4, 3, 4950000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `noorder` double NOT NULL,
  `idanggota` int(11) NOT NULL,
  `alamatkirim` text NOT NULL,
  `total` double NOT NULL,
  `tglorder` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `statusorder` varchar(20) NOT NULL,
  PRIMARY KEY (`idorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`idorder`, `noorder`, `idanggota`, `alamatkirim`, `total`, `tglorder`, `statusorder`) VALUES
(1, 20191227163901, 1, 'Jl. Raya Lubuk Begalung Padang, Sumatera Barat', 8337000, '2019-12-27 16:39:01', 'Lunas'),
(2, 20191229000516, 1, 'Jl. Raya Lubuk Begalung Padang, Sumatera Barat', 2733900, '2019-12-29 00:05:16', 'Lunas'),
(4, 20191229012136, 1, 'Jl. Raya Lubuk Begalung Padang, Sumatera Barat', 3300000, '2019-12-29 01:21:36', 'Dikirim'),
(5, 20191229012341, 1, 'Jl. Raya Lubuk Begalung Padang, Sumatera Barat', 4995000, '2019-12-29 01:23:41', 'Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `idbayar` int(11) NOT NULL AUTO_INCREMENT,
  `idorder` int(11) NOT NULL,
  `namabankpengirim` varchar(50) NOT NULL,
  `namapengirim` varchar(50) NOT NULL,
  `jumlahtransfer` double NOT NULL,
  `tgltransfer` date NOT NULL DEFAULT '0000-00-00',
  `namabankpenerima` varchar(50) NOT NULL,
  `bukti` text NOT NULL,
  PRIMARY KEY (`idbayar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pembayaran`
--


-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `idproduk` int(11) NOT NULL AUTO_INCREMENT,
  `idkat` int(11) NOT NULL,
  `idadmin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `stok` int(11) NOT NULL,
  `spesifikasi` text NOT NULL,
  `detail` text NOT NULL,
  `diskon` int(11) NOT NULL,
  `berat` float NOT NULL,
  `isikotak` text NOT NULL,
  `foto1` text NOT NULL,
  `foto2` text NOT NULL,
  `tglproduk` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idproduk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkat`, `idadmin`, `nama`, `harga`, `stok`, `spesifikasi`, `detail`, `diskon`, `berat`, `isikotak`, `foto1`, `foto2`, `tglproduk`) VALUES
(1, 1, 1, 'Xiaomi Mi4 4G - 16GB - Putih', 1650000, 2, '1 Tahun Garansi Distributor<br />\r\nSize 5.0 inches<br />\r\nSupport 4G all GSM Operator<br />\r\nInternal 16 GB, 2GB RAM, Memory Card slot No<br />\r\nCamera Primary 13 MP, Secondary 8 MP ', 'Xiaomi MI4 Smartphone menggunakan Qualcomm Snapdragon 801 2.5GHz Quad -core , RAM 2G + 16G ROM dengan layar 5.0inch 1920x1080 , MIUI V5 OS , menjanjikan cukup kecepatan operasi cepat cukup menakjubkan dan mengesankan . kamera depan 8.0MP untuk kenyamanan diri menangkap , kamera 13.0MP kembali bagi Anda untuk merekam setiap momen tunggal jelas ; semua tersedia untuk membuat ponsel ini pilihan yang paling berharga Xiaomi MI4', 0, 1, '1 x Mi 4i - 16GB - Putih<br />\r\n1 x Baterai<br />\r\n1 x Charger<br />\r\n1 x Kabel Data<br />\r\n1 x Kart', 'xiaomi-mi4-4g-16gb-putih-2624-6138548-e3306f8b2fcebfe41c_002.jpg', 'xiaomi-mi4-4g-16gb-putih-2624-6138548-e3306f8b2fcebfe41c1bd9.jpg', '2019-10-26 21:20:29'),
(2, 2, 1, 'LG 49 Full HD LED TV Silver - Model 49LH540T', 7499000, 3, 'LED Full HD 49"<br />\r\nTriple XD Engine<br />\r\nWarna dinamis<br />\r\nVirtual Surround<br />\r\nDesain metalik', 'Rasakan pengalaman menonton TV yang sesungguhnya dengan LG 49LH540T. Dengan desain yang modern dan kokoh, TV berlayar sebesar 49 inci ini hadir berbekal fitur-fitur fungsional yang menarik dan canggih. Kini Anda dapat menyaksikan aksi bintang favorit Anda berlaga dengan lebih puas berkat gambar visual yang begitu jernih dan tajam, didukung dengan audio yang tak kalah memukau.<br />\r\n<br />\r\nTriple XD Engine<br />\r\nNikmati kesempurnaan warna, kontras, dan kejernihan gambar dengan teknologi Triple XD Engine yang dimiliki televisi persembahan LG ini. Inovasi terkini LG Triple XD Engine mampu menghadirkan tampilan visual terbaik dengan warna dinamis yang tampak lebih nyata, membawa Anda ke dalam film ataupun multimedia apapun yang Anda saksikan. Dengan resolusi 1920x1080, aspek rasio Normal (4:3; 14:9) wide (16:9) dan layar 49"/124 cm tentu akan semakin menyempurnakan tampilan gambar pada TV ini.<br />\r\n<br />\r\nAudio Memukau<br />\r\nTidak hanya menghadirkan gambar Full HD untuk Anda, televisi dengan layar 49 inci ini juga dilengkapi dengan sistem audio yang dapat membuat pengalaman menonton Anda semakin seru. Efek Virtual Sound yang dihasilkannya dapat memberikan kesan nyata, membuat acara yang ditonton lebih terasa dan lebih dekat. Suara yang jernih juga memudahkan Anda untuk mendengar kata yang diucapkan. Dengan stereo, surround sound, clear voice dan sistem speaker 10 W/2Ch. Format audio AC3(Dolby Digital), EAC3,HAAC,AAC, Mpeg, MP3, PCM.<br />\r\n<br />\r\nDesain Metalik<br />\r\nSegala fitur unggul dari LG 49LH540T ini dikemas dalam desain televisi yang elegan, simpel, dengan permukaan berlapis metalik yang memberikan kesan mewah. Desain ini dapat mempercantik dekorasi ruang tamu, ruang keluarga, ataupun kamar tidur Anda.<br />\r\n<br />\r\nKonektivitas<br />\r\nProduk andalan ini memiliki 2 port HDMI, 1 USB, composit, component dan antenna. Tidak hanya itu produk dengan transmisi analog, Digital DVB T dan Digital DVB T2 ini mampu memberikan Anda rasa puas menonton TV.<br />\r\n<br />\r\nFitur<br />\r\nTV ini mempunyai vitur khusus time machine, built in games dan energy saving. Untuk memasang TV ini pada dinding juga mudah dilakukan karena telah dilengkapi dengan kompabilitas VESA 300x300, standard screw M6(4) dan wall mount bracket LSW440B; MSW240. Dan dengan daya rendah yaitu 0,5 W pada saat standby dan 60W pada saat mode on.', 20, 11, '1 x LG 49', 'lg-49-full-hd-led-tv-silver-model-49lh540t-khusus-jabodetabe.jpg', 'lg-49-full-hd-led-tv-silver-model-49lh540t-khusus-jabodetabe.jpg', '2019-10-26 21:57:53'),
(3, 4, 1, 'LG GN-B202RLCL Kulkas Inverter - Silver', 3505000, 1, 'Tipe Lemari Es : Freezer on top<br />\r\nKaki kubik : 1.0<br />\r\nDoor style/Number of doors : 2<br />\r\nModel : GN-B202RLCL<br />\r\nFungsi Tanpa-Beku : No', 'Tempered Glass Shelf<br />\r\nTempered glasses are strong enough to hold your heavy items up to 150kg.<br />\r\n<br />\r\nBig Vegetable box<br />\r\nExtended vegetable box provides approximately 15.9L of storage. Big size veggie box saves your trips to the market.', 22, 56, 'LG GN-B202RLCL Kulkas Inverter - Silver<br />\r\nKartu Garansi<br />\r\nBuku Manual', 'lg-gn-b202rlcl-kulkas-inverter-silver-khusus-jabodetabek_002.jpg', 'lg-gn-b202rlcl-kulkas-inverter-silver-khusus-jabodetabek_002.jpg', '2019-10-26 23:49:36'),
(4, 1, 1, 'Samsung Galaxy J5 2016 - 16GB - Emas', 2699000, 0, 'Layar 5.2" Super AMOLED<br />\r\nSistem Operasi Android<br />\r\nDual Kamera 13MP + 5 MP<br />\r\n2 GB RAM + 16 GB ROM<br />\r\nQuad-core 1.2 GHz', 'Kombinasi antara performa optimal disertai dengan desain elegan nan premium. Keduanya bisa didapatkan dari Samsung Galaxy J5 satu ini. Meluncurkan smartphone dengan platform Android, Samsung menghadirkan ponsel cerdas dengan kualitas dapur pacu mengagumkan untuk beragam kebutuhan Anda setiap hari: RAM mumpuni sebesar 2 GB yang ditandem dengan prosesor Quad-Core 1,2 GHz. Dilengkapi pula dengan desain yang ergonomis, Samsung Galaxy J5 bisa jadi pilihan untuk melengkapi segala kegiatan Anda.<br />\r\n<br />\r\nOptimalisasi Dapur Pacu<br />\r\nSamsung Galaxy J5 hadir dengan kemampuan dapur pacu luar biasa. Untuk menunjang kebutuhan Anda, ponsel cerdas besutan Samsung ini dibekali dengan prosesor QuadCore 1,2 GHz. Rasakan kemulusan operasi saat membuka berbagai macam aplikasi tanpa hambatan. Didukung pula dengan RAM sebesar 2 GB, membuka beragam aplikasi dalam waktu bersamaan juga tetap lancar tanpa lagging. Anda bisa melakukan multitasking menjelajah internet sembari mengakses email dan mendengarkan lagu dengan mulus tanpa hambatan.<br />\r\n<br />\r\nKapasitas Besar<br />\r\nRatusan foto, video, aplikasi, hingga banyaknya unduhan bukan masalah dengan ponsel yang satu ini. Ponsel cerdas Samsung ini kapasitas memori internal 16 GB yang dibenamkan di dalamnya memastikan penyimpanan beragam data yang besar dan mudah. Dilengkapi pula dengan slot microSD hingga 128 GB, Anda bisa perbesar kapasitas simpan dengan mudah. Ambil semua foto, rekam semua video dan unduh semua data tanpa ragu!<br />\r\n<br />\r\nLayar Luas nan Jernih<br />\r\nHadir dengan layar jernih sebesar 5.2", Samsung Galaxy J5 memberikan keleluasaan bagi jemari Anda untuk bergerak bebas di atas layar. Jutaan warna yang nyata siap menemani Anda menjelajah berbagai konten dengan nyaman. Dibekali pula dengan layar Super AMOLED dengan resolusi HD 720 x 1280p, Samsung memastikan Anda akan menikmati kualitas gambar yang jernih dan tajam dalam mengkases berbagai konten visual yang akan memanjakan mata Anda.<br />\r\n<br />\r\nTahan Seharian!<br />\r\nSamsung Galaxy J5 dibekali dengan baterai berkapasitas sebesar 3100 mAh. Kapasitasnya yang besar membuatnya mampu bertahan seharian tanpa masalah. Cukup dengan satu kali pengisian selama 2 jam, akses dunia dalam genggaman selama sehari penuh tanpa pengisian ulang. Dilengkapi pula dengan moda pengatur kecerahan, Anda bisa mengatur ketahanan baterai sesuai dengan kebutuhan Anda sehari-hari.<br />\r\n<br />\r\nKamera Impresif<br />\r\nRekam setiap jejak kehidupan yang begitu menyenangkan bersama orang-orang terdekat Anda! Melengkapi kebutuhan Anda untuk setiap kesempatan, Samsung hadir dengan kualitas kamera yang begitu impresif. Kamera belakang dengan resolusi 13 megapiksel dengan sensor CMOS membuat hasil jepretan yang lebih tajam sekalipun dalam kondisi minim cahaya berkat fitur lampu kilat LED. Selain itu, pengaturan kamera yang mudah dalam satu sentuhan juga memastikan Anda dapat menangkap beragam foto terbaik dengan mudah. Sementara bagi penggemar selfie dan pengguna video call, Samsung Galaxy J5 juga hadir dengan kamera depan sebesar 5 megapiksel untuk hasil gambar yang tetap jernih dan tajam. Dan bagi Anda yang ingin merekam momen lebih utuh, rekam video berkualits HD 1080p/30 fps dengan Samsung Galaxy J5.<br />\r\n<br />\r\nOS Teranyar<br />\r\nHadir dengan OS Android, Samsung Galaxy J5 dioptimalisasikan untuk memberi pengalaman terbaik saat menggunakan Android. Nikmati jutaan aplikasi lifestyle, games, hingga bisnis dan hiburan dengan satu sentuhan di Google PlayStore. Dengan ponsel Samsung, lengkapi segala kebutuhan Anda dengan dunia dalam genggaman.<br />\r\n<br />\r\nDesain Ergonomis<br />\r\nTipis nan kokoh. Samsung Galaxy J5 menawarkan perpaduan desain premium dalam balutan bodi yang kokoh. Menggunakan material yang dipilih khusus serta presisi kelas satu, Samsung mempersembahkan ponsel yang tangguh sekaligus tetap terasa nyaman dalam genggaman. Ukurannya sebesar 5.2" memastikan ia tetap terasa tipis dan pas di tangan. Hadir dengan pilihan warna yang elegan, Samsung Galaxy J5 bukan hanya sekedar alat komunikasi, namun cerminan ekspresi diri Anda! ', 10, 1, '1 x Samsung Galaxy J5 2016 - 16GB<br />\r\n1 x Charger<br />\r\n1 x Panduan Penggunaan<br />\r\n1 x Kartu ', 'samsung-galaxy-j5-2016-16gb-emas-3636-4945968-4ebaf8b5e780aa.jpg', 'samsung-galaxy-j5-2016-16gb-emas-3636-4945968-4ebaf8b5e780aa.jpg', '2019-10-26 23:53:54'),
(5, 3, 1, 'Asus A407MA-BV001T Intel N4000 4GB DDR4 1TB 14 Inch Windows 10 - Gray', 4250000, 2, 'Asus A407MA-BV001T, merupakan notebook dengan layar 14 Inch dan disematkan prosesor Intel N4000. Notebook ini dilengkapi dengan memori RAM 4 GB dan kapasitas penyimpanan 1 TB, serta didukung dengan Intel HD Graphics .', 'Processor Intel N4000<br />\r\nASUS A407 Series adalah laptop untuk beragam kebutuhan, baik untuk bekerja maupun bermain. Ditenagai prosesor Intel N4000, menjadikan A407 Series sebagai notebook gaya yang dirancang untuk mereka yang ingin tampil beda. A407 Series ini memiliki kualitas suara terbaik yang berasal dari ASUS SonicMaster. Dapatkan juga pengalaman bekerja instan dengan fitur instant on yang menyiapkan notebook dalam 2 detik dari mode sleep on. Sementara USB 3.0 menyediakan transfer data yang super cepat.<br />\r\n<br />\r\nDirancang untuk Produktifitas dan Hiburan<br />\r\nASUS A407 Series notebook ditenagai prosesor Intel® untuk kinerja komputasi yang lancar dan responsif. Kinerja prosesor ini dipasangkan dengan grafis terhebat dan chip kontrol memori canggih sehingga membuatnya ideal untuk pekerjaan sehari-hari atau dipakai menonton film dan video. A407 Series mampu menjawab semua tantangan tadi, menghadirkan kepada Anda kinerja multitask yang dibutuhkan untuk kerja dan bermain dalam bentuk yang ringkas<br />\r\n<br />\r\nIntel HD Graphics <br />\r\nNotebook ASUS A407 Series memiliki kartu grafis intel HD untuk menghadirkan tampilan visual yang memukau untuk menyunting foto dan video, atau menjalankan permainan terbaru.', 13, 5, '    1 x Asus A407MA-BV001T Intel N4000 4GB DDR4 1TB 14 Inch Windows 10<br />\r\n    1 x Charger<br />\r\n    1 x Tas Laptop<br />\r\n    1 x Manual', 'asus-a407ma-bv001t-intel-n4000-4gb-ddr4-1tb-14-inch-windows-10-gray-1.jpg', 'asus-a407ma-bv001t-intel-n4000-4gb-ddr4-1tb-14-inch-windows-10-gray-2.jpg', '2019-12-09 12:59:58'),
(6, 3, 1, 'ASUS X441BA-GA911T AMD A9-9425 4GB 1TB 14 Inch Windows 10 - Brown', 5155000, 1, 'ASUS X441BA menggabungkan performa perangkat keras yang sangat cepat dengan desain notebook yang ergonomis dan juga stylish. Dibekali dengan prosesor AMD A9-9425, yang mengerjakan semua perintah komputasi. Ditambah dengan kartu grafis AMD Radeon R5, memberikan visual yang lebih baik saat Anda menggunakan notebook Anda untuk bekerja maupun untuk bermain game.', 'Desain menakjubkan.<br />\r\nNotebook Asus X441 series dirancang untuk memberikan Anda pengalaman multimedia yang imersif. Ditambah dengan Asus Tru2Life video yang menjadikan visual Anda menonton film lebih hidup, dengan kualitas suara yang super jernih. Dirancang untuk penggunaan harian, asus hadir dengan warna-warna yang ekspresif dan tekstur yang memastikan Anda makin stylish. Sentuhan akhir yang mengkilap dan premium brusher-metal yang elegan.<br />\r\n<br />\r\nPerforma<br />\r\nNotebook ideal untuk rutinitas komputasi dan hiburan sehari-hari yang dipersembahkan oleh Asus. Didukung oleh prosesor AMD APU A9-9425. Menggunakan RAM SDRAM dengan kapasitas 4GB yang akan mumpuni setiap perintah komputasi Anda. Kartu grafis AMD Radeon R5 Graphics akan mendukung semua kinerja visual dengen sangat halus, memberikan visual bermain game yang hebat dan memukau, khusus untuk Anda. Tidak lupa koneksi 802.11b/g/n untuk performa internet yang super cepat.<br />\r\n<br />\r\nEquipped with Windows 10<br />\r\nASUS X441BA hadir dengan Windows 10 64Bit, sehingga siap untuk semua tugas komputasi sehari-hari dan menghibur Anda.<br />\r\n<br />\r\nTeknologi audio luar biasa dari ASUS SonicMaster<br />\r\nAsus tidak hanya mengembangkan performa prosesor dan desainnya saja. Asus membekali notebooknya dengan Asus SonicMaster, mengkombinasikan teknologi ICEpower dengan segala perangkat dan penyetelan audio yang dirancang dengan tujuan memberi Anda pengalaman audio terbaik. Amplifier, speaker besar 3W dan ruang resonansi 24cc memastikan pengiriman audio yang kuat dan bass yang lebih mendalam. Pengolahan sinyal tambahan dan penyetelan membantu memperbaiki rincian singkat, menyaring suara dan meningkatkan kejernihan audio, sehingga Anda benar-benar merasakan suara yang mendalam.<br />\r\n<br />\r\nAudioWizard-optimized tuning<br />\r\nASUS AudioWizard memberikan lima pilihan jenis audio (Music, Movie, Gaming, Speech, dan Recording) sehingga Anda dapat menyesuaikan dengan kebutuhan Anda. Hanya tinggal klik pilihan dari interface AudioWizard yang user-friendly.<br />\r\n<br />\r\nPixel-yang sempurna!<br />\r\nTeknologi ASUS Tru2Life Video membuat video Anda terlihat menakjubkan. Setiap pixel dalam video Anda meningkat ketajamannya dan kontras hingga 150% sehingga Anda akan menikmati kualitas gambar terbaik - setiap saat!<br />\r\n<br />\r\nLindungi Mata Anda dengan ASUS Eye Care<br />\r\nKebanyakan panel LED memancarkan cahaya biru – yang merupakan penyebab utama degenerasi makula dan masalah retina. Mode ASUS Eye Care efektif mengurangi tingkat cahaya biru hingga 33% untuk membuat mata Anda membaca lebih nyaman, dan untuk melindungi Anda dari potensi kelelahan mata dan penyakit lainnya.<br />\r\n<br />\r\nBaterai tahan lama dengan SuperBatt<br />\r\nAsus X441 series memiliki fitur baterai SuperBatt yang akan memberikan Anda hingga 700 siklus pengisian daya, 3 kali lebih hemat daripada masa pakai baterai standar. Menjaga kualitas dan performa notebook, Anda pun tidak perlu mengisi ulang daya setiap saat, menjadikan setiap kegiatan Anda menjadi lebih praktis.', 10, 6, '    1 x ASUS X441BA-GA911T AMD A9-9425 4GB 1TB 14 Inch Windows 10<br />\r\n    1 x Charger<br />\r\n    1 x Notebook Bag', 'asus-x441ba-ga911t-amd-a9-9425-4gb-1tb-14-inch-windows-10-brown-1.jpeg', 'asus-x441ba-ga911t-amd-a9-9425-4gb-1tb-14-inch-windows-10-brown-5.jpeg', '2019-12-09 13:03:10'),
(7, 1, 1, 'Chuwi HI8 SE Android 8.1 MTK8735 2GB 32GB 8 Inch - Black', 2157500, 3, 'Chuwi Hi8 SE merupakan tablet multimedia yang sangat handal. Dengan layar 8 inch IPS yang dapat menampilkan konten video dan game dengan sangat baik dan prosesor Quad Core MTK8735 yang memastikan berbagai aplikasi dapat berjalan dengan baik di tablet PC ini. Untuk Anda yang ingin tablet PC harga terjangkau untuk browsing, game, video dan media consumption lainnya cocok untuk memiliki Chuwi HI8 SE ini.', 'Enjoy Stunning Vision<br />\r\nChuwi Hi8 SE menggunakan layar IPS sehingga reproduksi warna sangat baik dan vibrant. Resolusi layar mencapai 1920 x 1200 HD sehingga Anda dapat menikmati konten video HD seperti youtube dengan baik di layar Chuwi ini.<br />\r\n<br />\r\nSleek Design<br />\r\nBentuk dari Chuwi Hi8 SE ini juga sangat tipis dan ringin agar tidak lelah saat digunakan dalam jangka waktu lama. Body dari tablet ini juga terbuat dari bahan full metal untuk memastikan durabilitas yang tinggi.<br />\r\n<br />\r\nQuad Core Processor<br />\r\nChuwi Hi8 SE menggunakan prosesor quad core MTK8735 sehingga berbagai aplikasi mulai dari game, video, browsing hingga streaming dapat berjalan dengan lancar.<br />\r\n<br />\r\nMore Expandable Storage<br />\r\nTablet PC Chuwi ini memiliki RAM 2GB dan storage internal sebanyak 32GB. Tidak perlu kwatir kehabisan storage karena Anda dapat menambah sendiri storage eksternal melalui micro SD sebesar 128GB.<br />\r\n<br />\r\n', 28, 1, '    1 x Chuwi HI8 SE Android 8.1 MTK8735 2GB 32GB 8 Inch<br />\r\n    1 x USB Cable<br />\r\n    1 x Adapter Charger<br />\r\n    1 x Manual', 'chuwi-hi8-se-android-81-mtk8735-2gb-32gb-8-inch-black-1.jpg', 'chuwi-hi8-se-android-81-mtk8735-2gb-32gb-8-inch-black-5.jpg', '2019-12-29 16:07:21'),
(8, 1, 1, 'Chuwi SurBook 2-in-1 Tablet PC Intel 6GB 128GB 12.3 Inch Windows 10 - Silver', 6990000, 1, 'Tablet terbaru dari Chuwi ini memiliki desain seperti Microsoft Surface Pro dimana terdapat kickstand pada bagian belakang dan dapat dipadukan dengan keyboard dan menjadi laptop. Surbook ini hadir dengan layar tablet berukuran 12.3 inch dan resolusi full HD 2736 x 1824. SurBook juga telah menggunakan prosesor intel generasi terbaru yaitu Apollo Lake sehingga berbagai aplikasi Windows dapat berjalan lancar pada tablet ini.', 'Its a PC-tablet, Its two in one<br />\r\nTablet ini dapat digabungkan dengan keyboard menggunakan sistem magnet dan berubah menjadi laptop.<br />\r\n<br />\r\n125 Degree Kick Stand<br />\r\nTerdapat kickstand pada bagian belakang tablet sehingga memudahkan Anda untuk meletakkan tablet di meja. Padukan dengan keyboard dan tablet berubah menjadi laptop.<br />\r\n<br />\r\nFull HD Resolution<br />\r\nChuwi Surbook ini hadir dengan layar tablet berukuran 12.3 inch dan resolusi full HD 2736x1824. Anda dapat menikmati berbagai konten media di tablet ini dengan sangat jernih dan detail.<br />\r\n<br />\r\nAwesome Cooling<br />\r\nBody dari tablet Chuwi Surbook terbuat dari bahan yang mudah mengkonduksi panas sehingga panas dari tablet akan tersebar secara merata dan hasilnya tablet akan tetap dingin saat beroperasi.', 5, 2, '    1 x Chuwi SurBook 2-in-1 Tablet PC Intel 6GB 128GB 12.3 Inch Windows 10<br />\r\n    1 x Charger', 'chuwi-surbook-2-in-1-tablet-pc-intel-6gb-128gb-123-inch-windows-10-silver-1.jpg', 'chuwi-surbook-2-in-1-tablet-pc-intel-6gb-128gb-123-inch-windows-10-silver-5.jpg', '2019-12-29 16:10:21'),
(9, 3, 1, 'Chuwi LapBook Plus Intel Atom X7-E3950 8GB 256GB 15.6 Inch Windows 10 - Gray', 7744500, 4, 'Untuk Anda yang sedang mencari notebook untuk menjalankan berbagai aplikasi ringan dan mudah dibawa pergi, Chuwi Lapbook Plus adalah produk yang tepat untuk Anda. Penggunaan prosesor Intel Atom generasi terbaru ditambah dengan ram berkapasitas 8GB DDR4 membuatnya sangat mampu untuk menjalankan berbagai aplikasi kantoran. Bentuknya yang tipis dan ringan membuat Anda bisa membawanya dengan mudah.', '4K Screen for Bold Visuals<br />\r\nChuwi LapBook Plus hadir dengan layar beukuran 15.6 inch dan mendukung resolusi 4K 3840x2160. Dengan kombinasi layar besar dan resolusi tinggi membuat laptop ini dapat menampilkan gambar dengan sangat bagus. Cocok digunakan untuk bermain game hingga nonton film.<br />\r\n<br />\r\nHDR HD Image Quality<br />\r\nTidak hanya itu, layar ini juga telah menggunakan teknologi HDR sehingga warna yang dihasilkan sangat tajam dan detail terutama pada bagian gelap dan terang. Brightness dari laptop ini dapat mencapai 340 nits.<br />\r\n<br />\r\nThin, Light as an Ultrabook<br />\r\nChuwi LapBook Plus ini menggunakan body aluminium yang ringan dan melalui proses CNC sehingga mulus dan terlihat mewah. Tidak hanya ringan, laptop ini juga sangat tipis hanya 6mm. Anda dapat membawa-bawa laptop ini tanpa beban berat.<br />\r\n<br />\r\nSuperior Apollo Lake Processor<br />\r\nChuwi LapBook Plus menggunakan proses Intel Atom Apollo Lake X7-E3950 dengan kecepatan mencapai 2.0GHz. Proses ini memastikan semua aplikasi dapat berjalan dengan lancar dan juga sangat hemat energi.<br />\r\n<br />\r\n4K Hard-decoding, Real Video Player<br />\r\nUntuk Anda yang hobi nonton film maka tidak perlu ragu dengan laptop ini karena telah menggunakan proses built-in HD Graphics 505. Proses ini dapat melakukan decoding 4K dengan sangat lancar hingga 60Hz.<br />\r\n<br />\r\n8GB Large Memory + Dual SSD Storage + Up to 9hrs Battery Life<br />\r\nLaptop ini juga menggunakan RAM sebesar 8GB DDR4 sehingga dapat melakukan multi-tasking dengan sangat lancar. Untuk masalah penyimpanan data juga sangat handal karena memiliki SSD 256GB untuk kecepatan akses data yang sangat cepat. Juga 256GB masih tidak cukup maka Anda dapat menambah M.2 SSD karena masih terdapat 1 slot kosong untuk penambahan memory. Baterai laptop ini dapat bertahan hingga 9 jam penggunaan non stop.', 24, 3, '1 x Chuwi LapBook Plus<br />\r\n1 x Charger Adapter<br />\r\nUser Manual', 'chuwi-lapbook-plus-intel-atom-x7-e3950-8gb-256gb-156-inch-windows-10-gray-1.jpg', 'chuwi-lapbook-plus-intel-atom-x7-e3950-8gb-256gb-156-inch-windows-10-gray-43.jpg', '2019-12-29 16:14:47'),
(10, 3, 1, 'Lenovo Ideapad 330-14AST AMD A9-9425 4GB 1TB 14 Inch Windows 10 - Gray', 4990000, 2, 'Lenovo Ideapad 330-14AST hadir dengan desain tipis dan ringan untuk kamu yang memiliki mobilitas tinggi. Berbekal prosesor AMD A9-9425 yang dipadukan dengan memory sebesar 4GB RAM dan kapasitas penyimpanan yang besar yaitu 1TB. Lenovo Ideapad 330 series menawarkan peforma yang cukup menjanjikan dalam mendukung aktifitas komputasi sehari-hari hingga kebutuhan entertaiment.', 'AMD A9-9425<br />\r\nLaptop ini sudah dibekali prosesor AMD A9-9425 yang mampu memberikan performa dan efisiensi baterai lebih baik dari generasi sebelumnya.<br />\r\n<br />\r\n14 Inch Display<br />\r\nDengan ukuran layarnya yang cukup besar, menjadikan laptop ini nyaman untuk digunakan terutama bagi sobat yang sehari-harinya bersentuhan dengan laptop dalam durasi waktu yang cukup lama. Layar Lenovo ideapad series memberikan tampilan yang jernih dan terang dalam format 16:9 widescreen serta resolusi sebesar 1366x768 pixel.<br />\r\n<br />\r\nLarge Storage<br />\r\nBagi Anda yang suka menyimpan file-file seperti film, lagu bahkan game maka laptop ini menjadi pilihan tepat untuk Anda. Dengan kapasitas 1TB Anda dapat menyimpan banyak file tanpa perlu lagi membeli harddisk eksternal.', 9, 4, '1 x Lenovo Ideapad 330-14AST AMD A9-9425 4GB 1TB 14 Inch Windows 10<br />\r\n1 x Adapter<br />\r\n1 x User Manual<br />\r\n1 x Warranty', 'lenovo-ideapad-330-14ast-amd-a9-9425-4gb-1tb-14-inch-windows-10-gray-1.jpg', 'lenovo-ideapad-330-14ast-amd-a9-9425-4gb-1tb-14-inch-windows-10-gray-2.jpg', '2019-12-29 16:16:59');
