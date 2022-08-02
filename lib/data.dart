Map<String, String> images = {"Muz": ""};

var fruitsJson = """ [
  {
    "id": 1,
    "name": "Muz",
    "image": "assets/images/fruits/muz.jpg",
    "sound": "assets/sounds/fruits/muz.mp3"
  },
  {
    "id": 2,
    "name": "Çilek",
    "image": "assets/images/fruits/cilek.jpeg",
    "sound": "assets/sounds/fruits/cilek.mp3"
  },
  {
    "id": 3,
    "name": "Armut",
    "image": "assets/images/fruits/armut.jpeg",
    "sound": "assets/sounds/fruits/armut.mp3"
  },
  {
    "id": 4,
    "name": "Vişne",
    "image": "assets/images/fruits/visne.webp",
    "sound": "assets/sounds/fruits/visne.mp3"
  },
  {
    "id": 5,
    "name": "Mandalina",
    "image": "assets/images/fruits/mandalina.webp",
    "sound": "assets/sounds/fruits/mandalina.mp3"
  },
  {
    "id": 6,
    "name": "Kavun",
    "image": "assets/images/fruits/kavun.webp",
    "sound": "assets/sounds/fruits/kavun.mp3"
  },
  {
    "id": 7,
    "name": "Karpuz",
    "image": "assets/images/fruits/karpuz.jpg",
    "sound": "assets/sounds/fruits/karpuz.mp3"
  },
  {
    "id": 8,
    "name": "Üzüm",
    "image": "assets/images/fruits/uzum.jpg",
    "sound": "assets/sounds/fruits/uzum.mp3"
  },
  {
    "id": 9,
    "name": "Ayva",
    "image": "assets/images/fruits/ayva.webp",
    "sound": "assets/sounds/fruits/ayva.mp3"
  },
  {
    "id": 10,
    "name": "Dut",
    "image": "assets/images/fruits/dut.jpg",
    "sound": "assets/sounds/fruits/dut.mp3"
  },
  {
    "id": 11,
    "name": "Kivi",
    "image": "assets/images/fruits/kivi.jpg",
    "sound": "assets/sounds/fruits/kivi.mp3"
  },
  {
    "id": 12,
    "name": "Erik",
    "image": "assets/images/fruits/erik.jpeg",
    "sound": "assets/sounds/fruits/erik.mp3"
  },
  {
    "id": 13,
    "name": "Kayısı",
    "image": "assets/images/fruits/kayisi.webp",
    "sound": "assets/sounds/fruits/kayisi.mp3"
  },
  {
    "id": 14,
    "name": "Elma",
    "image": "assets/images/fruits/elma.jpg",
    "sound": "assets/sounds/fruits/elma.mp3"
  },
  {
    "id": 15,
    "name": "Şeftali",
    "image": "assets/images/fruits/seftali.jpg",
    "sound": "assets/sounds/fruits/seftali.mp3"
  },
  {
    "id": 16,
    "name": "Portakal",
    "image": "assets/images/fruits/portakal.jpeg",
    "sound": "assets/sounds/fruits/portakal.mp3"
  },
  {
    "id": 17,
    "name": "Nar",
    "image": "assets/images/fruits/nar.jpg",
    "sound": "assets/sounds/fruits/nar.mp3"
  }
]""";
const animalsJson = """[
  {
    "id": 1,
    "name": "Kedi",
    "image":"assets/images/animalsJson/kedi.jpg",
       
    "sound": "assets/sounds/animals/kedi.mp3"
  },
  {
    "id": 2,
    "name": "Köpek",
    "image":"assets/images/animalsJson/kopek.jpg",
        
    "sound": "assets/sounds/animals/kopek.mp3"
  },
  {
    "id": 3,
    "name": "Tavşan",
    "image":"assets/images/animalsJson/tavsan.jpg",
       
    "sound": "assets/sounds/animals/tavsan.mp3"
  },
  {
    "id": 4,
    "name": "At",
    "image":"assets/images/animalsJson/at.jpg",
        
    "sound":"assets/sounds/animalsJson/at.mp3"
  },
  {
    "id": 5,
    "name": "Fil",
    "image":"assets/images/animalsJson/fil.jpeg",
        
    "sound": "assets/sounds/animals/fil.mp3"
  },
  {
    "id": 6,
    "name": "Zürafa",
    "image":"assets/images/animalsJson/zurafa.jpg",
        
    "sound" : "assets/sounds/animals/zurafa.mp3"
  },
  {
    "id": 7,
    "name": "Kuş",
    "image": "assets/images/animalsJson/kus.jpg",
    "sound": "assets/sounds/animals/kus.mp3"
  },
  {
    "id": 8,
    "name": "Balık",
    "image":"assets/images/animalsJson/balik.jpg",
    "sound": "assets/sounds/animals/balik.mp3"
  },
  {
    "id": 9,
    "name": "Aslan",
    "image":"assets/images/animalsJson/aslan.png",
    "sound": "assets/sounds/animals/aslan.mp3"
  },
  {
    "id": 10,
    "name": "Panda",
    "image":"assets/images/animalsJson/panda.jpg",
    "sound": "assets/sounds/animals/panda.mp3"
  },
  {
    "id": 11,
    "name": "Rakun",
    "image":"assets/images/animalsJson/rakun.jpg",
       
    "sound": "assets/sounds/animals/rakun.mp3"
  },
  {
    "id": 12,
    "name": "Sincap",
    "image":"assets/images/animalsJson/sincap.jpg",
       
    "sound": "assets/sounds/animals/sincap.mp3"
  },
  {
    "id": 13,
    "name": "Yunus",
    "image":"assets/images/animalsJson/yunus.jpg",
       
    "sound": "assets/sounds/animals/yunus.mp3"
  },
  {
    "id": 14,
    "name": "Ördek",
    "image":"assets/images/animalsJson/ordek.jpg",
       
    "sound": "assets/sounds/animals/ordek.mp3"
  },
  {
    "id": 15,
    "name": "İnek",
    "image":"assets/images/animalsJson/inek.jpg",
        
    "sound": "assets/sounds/animals/inek.mp3"
  },
  {
    "id": 16,
    "name": "Maymun",
    "image":"assets/images/animalsJson/maymun.jpg",
        
     "sound": "assets/sounds/animals/maymun.mp3"
  },
  {
    "id": 17,
    "name": "Ayı",
    "image":"assets/images/animalsJson/ayi.jpg",
       
     "sound": "assets/sounds/animals/ayi.mp3"
  },
  {
    "id": 18,
    "name": "Fare",
    "image":"assets/images/animalsJson/fare.jpg",

    "sound": "assets/sounds/animals/fare.mp3"
  },
  {
    "id": 19,
    "name": "Su Samuru",
    "image":"assets/images/animalsJson/susamuru.jpg",

    "sound": "assets/sounds/animals/susamuru.mp3"
  },
  {
    "id": 20,
    "name": "Çita",
    "image":"assets/images/animalsJson/cita.jpg",
        
    "sound":  "assets/sounds/animals/cita.mp3"
  },
  {
    "id": 21,
    "name": "Leopar",
    "image":"assets/images/animalsJson/leopar.jpg",
        
    "sound": "assets/sounds/animals/leopar.mp3"
  },
  {
    "id": 22,
    "name": "Koç",
    "image":"assets/images/animalsJson/koc.jpg",
        
    "sound":  "assets/sounds/animals/koc.mp3"
  },
  {
    "id": 23,
    "name": "Yılan",
    "image":"assets/images/animalsJson/yilan.jpg",
        
    "sound":  "assets/sounds/animals/yilan.mp3"
  },
  {
    "id": 24,
    "name": "Domuz",
    "image":"assets/images/animalsJson/domuz.jpg",
        
    "sound":"assets/sounds/animals/domuz.mp3"
  },
  {
    "id": 25,
    "name": "Kelebek",
    "image":"assets/images/animalsJson/kelebek.jpeg",
       
    "sound": "assets/sounds/animals/kelebek.mp3"
  },
  {
    "id": 26,
    "name": "Kaplumbağa",
    "image":"assets/images/animalsJson/kaplumbaga.jpg",
        
    "sound": "assets/sounds/animals/kaplumbaga.mp3"
  },
  {
    "id": 27,
    "name": "Baykuş",
    "image":"assets/images/animalsJson/baykus.jpg",
       
    "sound": "assets/sounds/animals/baykus.mp3"
  },
  {
    "id": 28,
    "name": "Tavuk",
    "image":"assets/images/animalsJson/tavuk.jpg",
        
    "sound": "assets/sounds/animals/tavuk.mp3"
  },
  {
    "id": 29,
    "name": "Devekuşu",
    "image":"assets/images/animalsJson/devekusu.jpeg",
       
    "sound": "assets/sounds/animals/devekusu.mp3"
  },
  {
    "id": 30,
    "name": "Timsah",
    "image":"assets/images/animalsJson/timsah.jpg",
       
    "sound":"assets/sounds/animals/timsah.mp3"
  },
  {
    "id": 31,
    "name": "Kanguru",
    "image":"assets/images/animalsJson/kanguru.jpg",
       
    "sound":  "assets/sounds/animals/kanguru.mp3"
  },
  {
    "id": 32,
    "name": "Kurbağa",
    "image":"assets/images/animalsJson/kurbaga.jpg",
       
    "sound": "assets/sounds/animals/kurbaga.mp3"
  },
  {
    "id": 33,
    "name": "Geyik",
    "image":"assets/images/animalsJson/geyik.jpg",
       
    "sound": "assets/sounds/animals/geyik.mp3"
  }
]""";

final fables = """[
  {
    "id": 1,
    "name": "Çirkin Ördek Yavrusu",
    "image": "assets/images/fables/cirkinordek.jpg",
    "sound": "assets/sounds/fables/cirkinordekyavrusu.mp3"
  },
  {
    "id": 2,
    "name": "Fareler Ülkesi",
    "image": "assets/images/fables/fareler.jpg",
    "sound": "assets/sounds/fables/farelerulkesi.mp3"
  },
  {
    "id": 3,
    "name": "Deredeki Küçük Kurbağa",
    "image": "assets/images/fables/kurba.jpg",
    "sound": "assets/sounds/fables/deredekikucukkurbaga.mp3"
  },
  {
    "id": 4,
    "name": "Leopar ve Koç",
    "image": "assets/images/fables/leopar.jpg",
    "sound": "assets/sounds/fables/leoparvekoc.mp3"
  },
  {
    "id": 5,
    "name": "Porsuk ve Ayı",
    "image": "assets/images/fables/porsukayi.jpg",
    "sound": "assets/sounds/fables/porsukveayi.mp3"
  },
  {
    "id": 6,
    "name": "Üç Küçük Domuzcuk",
    "image": "assets/images/fables/domuz.jpg",
    "sound": "assets/sounds/fables/uckucukdomuzcuk.mp3"
  }
]""";
