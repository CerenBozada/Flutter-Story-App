import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
const fruitQuestion = [
  { id: 1, name: "Muz", image: "https://agusik.com.ua/52642-large_default/banan.jpg" },
  { id: 2, name: "Çilek", image: "https://img.ubu.ru/gal_klubnika_donna3_118040369.jpeg" },
  { id: 3, name: "Armut", image: "https://gardenrus.ru/uploads/product/1500/1520/4ffb827c-b026-11e4-1d8c-0030486193be_b0a46d97-b0ee-11e4-1d8c-0030486193be.jpeg" },
  { id: 4, name: "Vişne", image: "https://im0-tub-tr.yandex.net/i?id=dff54b841f984b6102bb994e30efc898&n=13&exp=1" },
  { id: 5, name: "Mandalina", image: "https://im0-tub-tr.yandex.net/i?id=a93e1a7a1ecfd91c3166a7c30356849c&n=13&exp=1" },
  { id: 6, name: "Kavun", image: "https://im0-tub-tr.yandex.net/i?id=e3e6e53beacbce808ccf54f19e293a2a&n=13&exp=1" },
  { id: 7, name: "Karpuz", image: "https://florium.ua/media/catalog/product/w/a/watermelon-holodok-2.jpg" },
  { id: 8, name: "Üzüm", image: "https://nursery-garden.ru/upload/shop_4/1/2/4/item_124534/item_image124534.jpg" },
  { id: 9, name: "Ayva", image: "https://im0-tub-tr.yandex.net/i?id=599a493f559fe7d8cf56b0a12394b899&n=13&exp=1" },
  { id: 10, name: "Dut", image: "https://rassadacvetov.ru/wp-content/uploads/2018/06/shelkovica-belaya.jpg" },
  { id: 11, name: "Kivi", image: "https://i.pinimg.com/736x/eb/dc/dc/ebdcdc5464b2e1dc576851a00ed4d16a--next-day-the-next.jpg" },
  { id: 12, name: "Erik", image: "https://pbs.twimg.com/profile_images/3758793769/2cdcf4d6dc5003187113462df3f51f39_400x400.jpeg" },
  { id: 13, name: "Kayısı", image: "https://www.9months.ru/img_art/1078_art.jpg" },
  { id: 14, name: "Elma", image: "https://pbs.twimg.com/profile_images/937833383408930816/N0Eu15tY_400x400.jpg" },
  { id: 15, name: "Şeftali", image: "https://pbs.twimg.com/profile_images/1157927785345835008/CmtnbI_J_400x400.jpg" },
  { id: 16, name: "Portakal", image: "https://pbs.twimg.com/profile_images/547142738236678144/xX16_BbF.jpeg" },
  { id: 17, name: "Nar", image: "https://i.pinimg.com/736x/88/01/1f/88011f4de68e09b1ae44e0393d140290.jpg" },

]
const animalQuestions = [
  { id: 1, name: "Kedi", image: "https://pbs.twimg.com/profile_images/378800000623628092/e6b938f45540707f33470be028e292d1_400x400.jpeghttps://upload.wikimedia.org/wikipedia/commons/thumb/6/66/An_up-close_picture_of_a_curious_male_domestic_shorthair_tabby_cat.jpg/1200px-An_up-close_picture_of_a_curious_male_domestic_shorthair_tabby_cat.jpg", sound: "http://soundbible.com/grab.php?id=1687&type=mp3", isAsked: false, isAnsweredCorrectly: false },
  { id: 2, name: "Köpek", image: "https://pbs.twimg.com/profile_images/1573605286/dalmayal_400x400.jpg", sound: "http://soundbible.com/grab.php?id=75&type=mp3", isAsked: false, isAnsweredCorrectly: false },
  { id: 3, name: "Tavşan", image: "https://pbs.twimg.com/profile_images/627865463763128320/NvPIrkhu_400x400.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 4, name: "At", image: "https://pbs.twimg.com/profile_images/886336222326476800/P8z-11PM_400x400.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 5, name: "Fil", image: "https://pbs.twimg.com/profile_images/461179605273935873/H9x9SEQf_400x400.jpeg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 6, name: "Zürafa", image: "https://im0-tub-tr.yandex.net/i?id=4f4a489342342a152d5d2ad1189159bf&n=13&exp=1", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 7, name: "Kuş", image: "https://animaloilmaker.com/images/average-violet-opaline-8.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 8, name: "Balık", image: "https://avatars.mds.yandex.net/get-pdb/2800487/cab29aab-3a01-4d55-b326-1738bc929c36/s1200?webp=false", sound: "http://soundbible.com/grab.php?id=1345&type=mp3", isAsked: false, isAnsweredCorrectly: false },
  { id: 9, name: "Aslan", image: "https://pbs.twimg.com/profile_images/1110433124645662721/_z0dldIP_400x400.png", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 10, name: "Panda", image: "https://pbs.twimg.com/profile_images/1159084599051542529/-9Cri5Bp_400x400.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 11, name: "Rakun", image: "https://pbs.twimg.com/profile_images/581574562548154368/Z-biYIjw_400x400.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 12, name: "Sincap", image: "https://yt3.ggpht.com/a/AGF-l79AuCIWxP28sin73FFN0Zb25FcWCdsluJxjmw=s400-mo-c-c0xffffffff-rj-k-no", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 13, name: "Yunus", image: "https://pbs.twimg.com/profile_images/619044929348632576/lBeC8Amb_400x400.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 14, name: "Ördek", image: "https://pbs.twimg.com/profile_images/966648730467340293/lxO98bYv_400x400.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 15, name: "İnek", image: "https://pbs.twimg.com/profile_images/834393310903095296/mVzkTzz8_400x400.jpg", sound: "", isAsked: false, isAnsweredCorrectly: false },
  { id: 16, name: "Maymun", image: "https://pbs.twimg.com/profile_images/1175405224690946049/HVZ9DJfX.jpg" },
  { id: 17, name: "Ayı", image: "https://static3.stcont.com/datas/photos/800x800/eb/3c/82abfd8b7a0c8966f638d5ea0bf8.jpg?0" },
];
console.log(animalQuestions);
function shuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * i)
    const temp = array[i]
    array[i] = array[j]
    array[j] = temp
  }
  return array
}
export default new Vuex.Store({
  state: {
    questions: [],
    currentQuestionIndex: 0,
    currentQuestions: [],
    correctQuestion: {}
  },
  getters: {
  },
  mutations: {
    start(state) {
      let questionList = fruitQuestion;
      questionList = shuffle(questionList);
      Vue.set(state, "questions", [...questionList]);
      const currentQuestion = state.questions[state.currentQuestionIndex]; //state.questions.find(question => question.id == state.currentQuestionId);
      const randomUniqueQuestions = questionList.filter(question => question.id != currentQuestion.id).slice(0, 3);
      let finalQuestions = [...randomUniqueQuestions, currentQuestion];
      finalQuestions = shuffle(finalQuestions);
      Vue.set(state, "currentQuestions", [...finalQuestions]);
      Vue.set(state, "correctQuestion", Object.assign({}, currentQuestion));
      // console.log(currentQuestion);



    }, correctAnswer(state) {
      state.currentQuestionIndex++;
      const currentQuestion = state.questions[state.currentQuestionIndex]; //state.questions.find(question => question.id == state.currentQuestionId);
      const randomUniqueQuestions = shuffle(state.questions.filter(question => question.id != currentQuestion.id)).slice(0, 3);
      let finalQuestions = [...randomUniqueQuestions, currentQuestion];
      finalQuestions = shuffle(finalQuestions);
      Vue.set(state, "currentQuestions", [...finalQuestions]);
      Vue.set(state, "correctQuestion", Object.assign({}, currentQuestion));

    }
  },
  actions: {
    start({ commit }) {
      commit('start');

    }, correctAnswer({ commit }) {
      commit('correctAnswer');

    }
  },
  modules: {
  }
})
