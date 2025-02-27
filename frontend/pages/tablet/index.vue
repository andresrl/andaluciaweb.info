<template>
  <NotFound v-if="connectionLost" />
  <Tablet_Main id="0" />
</template>

<script setup>
import { ref, onBeforeMount, onMounted } from "vue";
</script>

<style lang="scss" scoped>
</style>
