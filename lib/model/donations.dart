class Donations {
  String title;
  String description;
  String imageUrl;
  List imageUrls;
  String category;
  int currentDonation;
  int totalDonation;

  Donations({
    this.imageUrl,
    this.imageUrls,
    this.title,
    this.description,
    this.category,
    this.currentDonation,
    this.totalDonation,
  });
}

var donationList = [
  Donations(
    title: 'Donasi Bencana',
    description:
        'Banjir bandang terjadi di banten yang mengakibatkan ratusan rumah harus mengungsi.',
    imageUrl: 'assets/images/donasi-bencana-2.png',
    imageUrls: [
      'assets/images/donasi-bencana.jpeg',
      'assets/images/donasi-bencana-2.png',
      'assets/images/donasi-bencana-3.jpg',
    ],
    category: 'Bencana',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Meningkatkan Kesehatan',
    description:
        'Kesehatan adalah investasi yang sangat penting, mari kita ber donasi untuk sodara-sodara kita yang membutuhkan agar mereka bisa hidup dengan sehat',
    imageUrl: 'assets/images/kesehatan1.jpg',
    category: 'Kesehatan',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Bantu pendidikan sulbar',
    description:
        'beberapa anak di sulbar kesulitan untuk mendapatkan tempat belajar yang layak, mari kita bersama bergotong royong untuk membangun sarana prasarana pendidikan agar indonesia memiliki bibit bibit yang memiliki kopetensi yang luar biasa',
    imageUrl: 'assets/images/donasi-pendidikan-2.png',
    category: 'Pendidikan',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Air bersih untuk palestina',
    description:
        'sodara-sodara kita di palestina kesulitan untuk mendapatkan air bersih mari kita bantu merekan untuk mendapatkan air bersih',
    imageUrl: 'assets/images/donasi-air-bersih.jpg',
    category: 'Air bersih',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Bantuan APD tenaga medis',
    description:
        'melihat dari naiknya angka kasus positif covid-19 di indonesia membuat tenaga medis kewalahan banhkan sampai kekurangan alat pelindung diri, maka dari itu mari kita bantu tenaga medis agar selalu memiliki alat pelindung diri yang layak',
    imageUrl: 'assets/images/donasi-apd.jpg',
    imageUrls: [
      'assets/images/donasi-apd.jpg',
      'assets/images/donasi-kesehatan.jpg',
      'assets/images/donasi-pendidikan-3.jpg',
    ],
    category: 'APD',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Donasi Bencana',
    description:
        'Banjir bandang terjadi di banten yang mengakibatkan ratusan rumah harus mengungsi.',
    imageUrl: 'assets/images/donasi-bencana-2.png',
    category: 'Bencana',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Meningkatkan Kesehatan',
    description:
        'Kesehatan adalah investasi yang sangat penting, mari kita ber donasi untuk sodara-sodara kita yang membutuhkan agar mereka bisa hidup dengan sehat',
    imageUrl: 'assets/images/kesehatan1.jpg',
    category: 'Kesehatan',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Bantu pendidikan sulbar',
    description:
        'beberapa anak di sulbar kesulitan untuk mendapatkan tempat belajar yang layak, mari kita bersama bergotong royong untuk membangun sarana prasarana pendidikan agar indonesia memiliki bibit bibit yang memiliki kopetensi yang luar biasa',
    imageUrl: 'assets/images/donasi-pendidikan-2.png',
    category: 'Pendidikan',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Air bersih untuk palestina',
    description:
        'sodara-sodara kita di palestina kesulitan untuk mendapatkan air bersih mari kita bantu merekan untuk mendapatkan air bersih',
    imageUrl: 'assets/images/donasi-air-bersih.jpg',
    category: 'Air bersih',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
  Donations(
    title: 'Bantuan APD tenaga medis',
    description:
        'melihat dari naiknya angka kasus positif covid-19 di indonesia membuat tenaga medis kewalahan banhkan sampai kekurangan alat pelindung diri, maka dari itu mari kita bantu tenaga medis agar selalu memiliki alat pelindung diri yang layak',
    imageUrl: 'assets/images/donasi-apd.jpg',
    category: 'APD',
    currentDonation: 20000000,
    totalDonation: 10000000,
  ),
];
