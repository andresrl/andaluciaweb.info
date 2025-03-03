<template>
  <div
    class="wrapper"
    :class="{ 'animate__animated animate__fadeIn': isAnimated }"
  >
    <div v-if="!tiempoReal?.visitantes" class="loading">
      Cargando datos...
    </div>
    <template v-else>
      <header :class="{ 'animate__animated animate__slideInUp': isAnimated }">
        <img src="/img/logo.png" alt="" />
      </header>
      <h1 :class="{ 'animate__animated animate__slideInUp': isAnimated }">
        SMART DATA
      </h1>
      <h2 :class="{ 'animate__animated animate__slideInUp': isAnimated }">
        ITB 2025 REAL TIME DATA
      </h2>
      <div class="content">
        <div
          class="content-izquierda"
          :class="{ 'animate__animated animate__slideInUp': isAnimated }"
        >
          <div style="display: flex; justify-content: space-between">
            <div
              class="info-izquierda"
              :class="{ 'animate__animated animate__slideInUp': isAnimated }"
            >
              <div class="numero">{{ tiempoReal?.visitantes || 0 }}</div>
              <div class="texto">Visitors</div>
            </div>
            <div
            class="info-izquierda"
            :class="{ 'animate__animated animate__slideInUp': isAnimated }"
          >
            <div class="numero">{{ emocionPredominanteNumero }}%</div>
            <div class="texto">{{ emocionPredominanteTexto }}</div>
          </div>
            <div
              class="info-izquierda"
              :class="{ 'animate__animated animate__slideInUp': isAnimated }"
            >
              <div class="numero">{{ tiempoReal?.edad || 0 }}</div>
              <div class="texto">Average<br />age</div>
            </div>
          </div>
          <div style="margin-left: 15%; margin-top: 2em;width: 70%; text-align: center;">
            <div style="display: flex; justify-content: space-between">
              <div
                class="info-izquierda"
                :class="{ 'animate__animated animate__slideInUp': isAnimated }"
              >
                <div class="numero">{{ tiempoReal?.hombres && tiempoReal?.visitantes ? Math.floor(tiempoReal.hombres/tiempoReal.visitantes * 1) : 0 }}%</div>
                <div class="texto">Men</div>
              </div>
              <div
                class="info-izquierda"
                :class="{ 'animate__animated animate__slideInUp': isAnimated }"
              >
                <div class="numero">{{ tiempoReal?.mujeres && tiempoReal?.visitantes ? Math.floor(tiempoReal.mujeres/tiempoReal.visitantes * 1) : 0 }}%</div>
                <div class="texto">Women</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer><img src="/img/footer_4k_horizontal.png" alt="Footer" /></footer>
    </template>
  </div>
</template>

<script setup>
import { computed, onMounted, watch } from "vue";
  const props = defineProps({
    currentSlideIndex: Number,
    index: Number,
    tiempoReal: {
      type: Object,
      required: true,
      default: () => ({
        visitantes: 0,
        edad: 0,
        hombres: 0,
        mujeres: 0,
        "emocion predominante": ""
      })
    }
  });

  const isAnimated = computed(() => {
    return props.currentSlideIndex === props.index;
  });

  const emocionPredominanteNumero = computed(() => {
    return props.tiempoReal["emocion predominante"]?.split("_")?.[1] || 0;
  });

  const emocionPredominanteTexto = computed(() => {
    return props.tiempoReal["emocion predominante"]
      ?.split("_")?.[0]
      ?.toUpperCase() || '';
  });

  // Agregar watch para debuggear
  watch(() => props.tiempoReal, (newValue) => {
    console.log('tiempoReal actualizado:', newValue);
  }, { deep: true });

  onMounted(() => {
    console.log('Datos iniciales:', {
      emocion: props.tiempoReal["emocion predominante"],
      visitantes: props.tiempoReal.visitantes,
      hombres: props.tiempoReal.hombres,
      mujeres: props.tiempoReal.mujeres,
      edad: props.tiempoReal.edad
    });
  });
</script>
<style lang="scss" scoped>
  $verde: #3333ff;
  $verde-claro: #3333ff;

  @keyframes rotateBackground {
    from {
      transform: rotate(0deg);
    }
    to {
      transform: rotate(360deg);
    }
  }

  header {
    text-align: center;
    width: 100%;
    margin: 3em auto 0 auto;
    img {
      width: 15%;
    }
  }


  footer {
  text-align: center;
  width: 100%;
  line-height: 0;
  img {
    width: 100%;
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
    font-size: 3em;
    color: $verde;
    font-family: "Barlow-ExtraLightItalic", sans-serif;
    margin: 1em auto 0 auto;
  }

  h2 {
    text-align: center;
    color: white;
    font-size: 1.55em;
    font-family: "Barlow-ExtraLightItalic", sans-serif;
    margin: 0;
  }

  .content {
    display: flex;
    flex-grow: 1;
    text-align: center;
    margin: auto;
    width: 100%;
    scale: 0.85;
  }

  .content-izquierda,
  .content-derecha {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin: auto;
    width: 60%;
  }

  .content-derecha {
    margin: 5em;
  }

  .info-izquierda {
    padding: 4em;
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
      font-size: 5em;
      color: white;
      width: 2em;
      text-align: center;
      margin: auto;
    }

    .texto {
      font-size: 1.6em;
      font-family: Barlow-SemiBold;
      line-height: 1em;
      margin-top: -.5em;
      text-transform: uppercase;
    }
  }
</style>
