<template>
  <div class="wrapper" :Xclass="wrapperClass">
    <slot></slot>
  </div>
</template>

<script setup>

import { defineProps, computed } from "vue"

const props = defineProps({
  step: {
    type: Number,
    required: true,
  },
});

const wrapperClass = computed(() => {
  if (props.step === 2 || props.step === 3 || props.step === 4) {
    return "orange";
  } else if (props.step === 5) {
    return "red";
  }
  else {
    return "green";
  }
});

</script>

<style lang="scss" scoped>
// cosas comunes

h1 {
  margin: 0;
}

$verde: #3333ff;
$rojo: #d41c24;
$naranja: #e2973b;
.wrapper {
  width: 800px;
  height: 1280px;
  background-color: #000;
  @media (min-width: 801px) {
    width: 1280px;
    height: 800px;
  }
  &.green {
    background-color: $verde;
  }
  &.orange {
    background-color: $naranja;
  }
  &.red {
    background-color: $rojo;
  }
}
</style>
