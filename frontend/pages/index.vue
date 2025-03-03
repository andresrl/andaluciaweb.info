<template>
  <div class="wrapper">
    <NotFound v-if="connectionLost" />

    <Swiper
      v-else-if="!loading"
      ref="miSwiper"
      @swiper="onSwiper"
      :modules="modules"
      :autoplay="{ delay: DELAY_SLIDER_EMOCIONES, disableOnInteraction: false }"
      :loop="true"
    >
      <SwiperSlide v-for="(ficha, index) in fichas" :key="`ficha-${index}`">
        <SlideEmocion
          :ficha="ficha"
          :current-slide-index="currentSlideIndex"
          :index="index"
        />
      </SwiperSlide>

      <SwiperSlide key="tiemporeal-1">
        <SlideTiempoReal
          :current-slide-index="currentSlideIndex"
          :index="fichas.length"
          :tiempo-real="tiempoReal"
        />
      </SwiperSlide>

      <SwiperSlide key="tiemporeal-2">
        <SlideTiempoRealSegunda
          :tiempo-real="tiempoReal"
          :current-slide-index="currentSlideIndex"
          :index="fichas.length + 1"
        />
      </SwiperSlide>

      <!-- <SwiperSlide v-for="(post, index) in posts" :key="`post-${index}`">
        <SlideCompanyPost
          :empresa="post"
          :index="fichas.length + 2 + index"
          :current-slide-index="currentSlideIndex"
        />
      </SwiperSlide> -->
    </Swiper>
  </div>
</template>


<script setup>
import { onBeforeMount, onBeforeUnmount, onMounted, ref } from "vue";
import { Swiper, SwiperSlide } from "swiper/vue";
import { Autoplay, EffectFade, Navigation, Pagination } from "swiper/modules";
import "swiper/css";

const BEARER_TOKEN =
    "Bearer 10|oNZhvGbkZE8MJdqIFs79xix6Zx8zmBrCfwfoCOjLf716dc67";
  const API_ENDPOINT = "https://andalusiancrushlink.com/api";

const DELAY_SLIDER_EMOCIONES = 10 * 1000;
const DELAY_SLIDER_TIEMPO_REAL = 7 * 1000;
const DELAY_SLIDER_POSTS = 10 * 1000;

const REFRESH_DATA_INTERVAL = 30 * 1000; // 30 segundos

const modules = [EffectFade, Autoplay, Pagination, Navigation];
const swiperInstance = ref(null);
const currentSlideIndex = ref(0);

const runtimeConfig = useRuntimeConfig();

let checkConnectionId;
let intervalData;
const loading = ref(true);
const miSwiper = ref(null);
const connectionLost = ref(false);
const fichas = ref([]);
const tiempoReal = ref({});
const posts = ref([]);

const fetchDataEmociones = async () => {
  const result = await $fetch(
    runtimeConfig.public.BACKEND_SERVER_URL + "/api/get-goli-data",
  );

  fichas.value = result
    .filter((ficha) => ficha.Anhelo)
    .map((ficha) => {
      return {
        nombre: ficha.__EMPTY.toLowerCase().trim(),
        admiration: ficha["Admiración "],
        longing: ficha["Anhelo"],
        devotion: ficha["Devoción"],
        enthusiasm: ficha["Entusiasmo "],
        fervency: ficha["Fervor "],
        optimism: ficha["Gozo"],
        surprise: ficha["Sorpresa "],
        tenderness: ficha["Ternura"],
        reacciones: ficha["TOTAL REACCIONES"],
      };
    });
};

const fetchDataTiempoReal = async () => {
  const goli2 = (
    await $fetch(runtimeConfig.public.BACKEND_SERVER_URL + "/api/get-goli-2-data")
  )[0];

  // TODO
  var api2 = {
    companies: 2371,
    professional: 346,
    meetings: 122,
  };

  const api2fetch = await $fetch(`${API_ENDPOINT}/stats`, {
    headers: {
      Authorization: BEARER_TOKEN,
    },
  });
  api2 = {
    companies: api2fetch.data['professional-and'],
    professional: api2fetch.data.professional,
    meetings: api2fetch.data.blocked_slots,
  };

  // const goli2 = await $fetch(
  //   runtimeConfig.public.BACKEND_SERVER_URL + "/api/TODO",
  // );

  tiempoReal.value = {
    ...goli2,
    ...api2,
  };
};

const fetchDataPosts = async () => {
  const BEARER_TOKEN =
    "Bearer 10|oNZhvGbkZE8MJdqIFs79xix6Zx8zmBrCfwfoCOjLf716dc67";
  const API_ENDPOINT = "https://andalusiancrushlink.com/api";

  const { data } = await $fetch(`${API_ENDPOINT}/companies`, {
    headers: {
      Authorization: BEARER_TOKEN,
    },
  });

  posts.value = data.filter((c) => !!c.featured_offer);
};

const onSwiper = (swiper) => {
  swiperInstance.value = swiper;
  swiperInstance.value.on("slideChange", () => {
    currentSlideIndex.value = swiperInstance.value.realIndex;

    let delay = DELAY_SLIDER_EMOCIONES;

    // Hay dos slides de tiempo real
    if (
      currentSlideIndex.value === fichas.value.length ||
      currentSlideIndex.value === fichas.value.length + 1
    ) {
      delay = DELAY_SLIDER_TIEMPO_REAL;
    } else if (currentSlideIndex.value > fichas.value.length) {
      delay = DELAY_SLIDER_POSTS;
    }
    swiperInstance.value.params.autoplay.delay = delay;
  });
};

onBeforeMount(() => {
  intervalData = setInterval(async () => {
    fetchDataEmociones();
    fetchDataTiempoReal();
    fetchDataPosts();
  }, REFRESH_DATA_INTERVAL);

  fetchDataEmociones();
  fetchDataTiempoReal();
  fetchDataPosts();

  setTimeout(() => {
    loading.value = false;
  }, 1000);
});

onMounted(() => {
  checkConnectionId = setInterval(async () => {
    try {
      await $fetch(runtimeConfig.public.BACKEND_SERVER_URL + "/api/ping/");
      connectionLost.value = false;
    } catch (error) {
      if (
        (error.response && error.response.status === 404) ||
        error.response.status === 500
      ) {
        connectionLost.value = true;
      }
    }
  }, 5000);
});

onBeforeUnmount(() => {
  clearInterval(intervalData);
  clearInterval(checkConnectionId);
});
</script>

<style lang="scss" scoped>
body {
  background-color: #000;
}
.wrapper {
  width: 100%;
  height: 100vh;
  background-color: #000;
}
</style>