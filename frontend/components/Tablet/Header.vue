<template>

  <header>
    <div class="w33 countdown">
      <div v-if="countDownCount!=='false' && showCountDown">{{props.countDownCount}}</div>
      <img :src="companyLogo" v-if="!showCountDown" alt="" style="max-height: 100px;" />  
    </div>
    <div class="w33 logo">
      <img src="/img/tablet/andalusian-crush-logo@2x.png" alt="">
    </div>
    <div class="w33 cta">
      <a v-if="ctaText!==''" href="#" @click="emitChangeStep">{{props.ctaText}}</a>
      <!-- <a v-if="ctaText!=='false'" href="#" @click="emitChangeStep">{{props.ctaText}}</a> -->
      <!-- <div v-if="tableText!=='false'" class="tableText">{{props.tableText}}</div> -->
    </div>
  </header>

</template>


<script setup>

const props = defineProps({
  ctaGoToStep: {
    type: Number,
    required: true,
  },
  ctaText: {
    type: String,
    required: true,
  },
  tableText: {
    type: String,
    required: true,
  },
  companyLogo: {
    type: String,
    required: true,
  },
  countDownCount: {
    type: Number,
    required: true,
  },
  showCountDown: {
    type: Boolean, 
    required: true
  }
});

// Define los eventos que el componente puede emitir
const emit = defineEmits(["changeStep"]);

// Función para emitir el evento changeStep
function emitChangeStep() {
  location.reload();
  // emit("changeStep", props.ctaGoToStep);
  // console.log(props.ctaGoToStep)
}

</script>

<style lang="scss" scoped>
$verde: #3333ff;
$rojo: #d41c24;
$naranja: #e2973b;
$amarillo: #3333ff;

header {
  background-color: #000;
  padding: 30px 80px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  .w33 {
    min-width: 33%;
  }
  .countdown div {
    color: #fff;
    font-size: 24px;
    font-style: 'Barlow-Black';
    font-size: 65px;
    line-height: 0;
    @media (min-width: 801px) {
      font-size: 85px;
    }
  }
  .logo {
    text-align: center;
    // display: flex;
    // justify-content: center;
    img {
      width: 180px;
      @media (min-width: 801px) {
        width: 240px;
      }
    }
  }
  .cta {
    text-align: right;
    a {
      font-family: 'Barlow-ExtraLightItalic', sans-serif;
      font-size: 24px;
      text-transform: uppercase;
      border: 2px solid $rojo;
      background-color: $rojo;
      color: #fff;
      text-decoration: none;
      display: inline-block;
      padding: 10px 20px;
      &:hover {
        background-color: $rojo;
      }
    }
    @media (min-width: 801px) {
      a {
        font-size: 30px;
      }
    }
    .tableText {
      color: #fff;
      font-family: 'Barlow-ExtraLight', sans-serif;
      font-size: 40px;
      text-transform: uppercase;
      text-align: right;
      @media (min-width: 801px) {
        font-size: 60px;
      }
    }
  }
}

</style>
