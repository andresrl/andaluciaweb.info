<template>
  <div
    class="wrapper"
    :class="{ 'animate__animated animate__fadeIn': isAnimated }"
  >
    <header :class="{ 'animate__animated animate__slideInUp': isAnimated }">
      <img src="/img/logo.png" alt="" />
    </header>
    <h1 :class="{ 'animate__animated animate__slideInUp': isAnimated }">
      NETWORKING DATA
    </h1>
    <h2 :class="{ 'animate__animated animate__slideInUp': isAnimated }">
      ITB 2025 REAL TIME DATA
    </h2>
    <div class="content">
      <div
        class="inner"
        :class="{ 'animate__animated animate__slideInUp': isAnimated }"
      >
        <div
            class="info-izquierda"
            :class="{ 'animate__animated animate__slideInUp': isAnimated }"
          >
            <div class="numero">{{ tiempoReal.professional }}</div>
            <div class="texto">Professionals</div>
          </div>
        <div
          class="info-arriba"
          :class="{ 'animate__animated animate__slideInUp': isAnimated }"
        >
          <div class="numero" style="">{{ tiempoReal.companies }}</div>
          <div class="texto">Andalusian<br />Companies</div>
        </div>
        <div
          class="info-izquierda"
          :class="{ 'animate__animated animate__slideInUp': isAnimated }"
        >
          <div class="numero">{{ tiempoReal.meetings }}</div>
          <div class="texto">Meetings</div>
        </div>
      </div>
    </div>
    <footer><img src="/img/footer_4k_horizontal.png" alt="Footer" /></footer>
  </div>
</template>

<script setup>
const props = defineProps({
  currentSlideIndex: Number,
  index: Number,
  tiempoReal: Object,
});

const isAnimated = computed(() => {
  return props.currentSlideIndex === props.index;
});
</script>


<style lang="scss" scoped>
$verde: #3333ff;
$verde-claro: #3333ff;

* {
  font-family: Barlow-SemiBold;
}

header {
  text-align: center;
  width: 20%;
  margin: 3em auto 0 auto;
}

footer {
  text-align: center;
  width: 100%;
  line-height: 0;
  img {
    width: 100%;
  }
}

@keyframes rotateBackground {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

* {
  color: $verde;
  font-family: Barlow-Black;
}

.wrapper {
  background-color: black;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

h1 {
  text-align: center;
  font-size: 4em;
  color: $verde;
  font-family: "Barlow-ExtraLightItalic", sans-serif;
  margin: 1em auto 0 auto;
}

h2 {
  text-align: center;
  color: white;
  font-size: 2em;
  font-family: "Barlow-ExtraLightItalic", sans-serif;
  margin: 0;
}

.content {
  display: flex;
  flex-grow: 1;
  text-align: center;
  margin: auto;
  gap: 3em;
  scale: 0.85;
}

.inner {
  display: flex;
  // flex-direction: row;
  justify-content: space-between;
  gap: 15em;
}

.info-arriba {
  padding: 7em;
  position: relative;

  &::before {
    content: " ";
    position: absolute;
    background: url("/img/circulo.png") no-repeat;
    background-size: contain;
    background-position: center center;
    background-repeat: no-repeat;
    animation: rotateBackground 15s linear infinite;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
  }

  .numero {
    font-size: 12em;
    color: white;
  }

  .texto {
    font-size: 1.5em;
    font-family: Barlow-SemiBold;
    line-height: 1em;
    margin-top: -1em;
    text-transform: uppercase;
  }
}

.info-izquierda {
  // padding: 5em;
  padding: 13em 0em;
  width: 600px !important;
  position: relative;

  &::before {
    content: " ";
    position: absolute;
    background: url("/img/circulo.png") no-repeat;
    background-size: contain;
    background-position: center center;
    background-repeat: no-repeat;
    animation: rotateBackground 10s linear infinite;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
  }

  .numero {
    font-size: 6em;
    color: white;
  }

  .texto {
    font-size: 1.5em;
    font-family: Barlow-SemiBold;
    line-height: 1em;
    margin-top: -1em;
    text-transform: uppercase;
  }
}


</style>
