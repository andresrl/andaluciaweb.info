<script setup>
const props = defineProps({
  mesa: String,
});

const spaces = inject("spaces");
const slots = inject("slots");
const organizers = inject("organizers");
const mesaSeleccionada = inject("mesaSeleccionada");

const estaSeleccionada = computed(() => {
  return mesaSeleccionada.value === props.mesa;
});

const empresa = computed(() => {
  const space = spaces.value.find((space) => space.table_name === props.mesa);

  if (space?.user_id) {
    return organizers.value.find(
      (organizer) => organizer.id === space?.user_id,
    );
  }

  return slots.value.find((slot) => slot.meeting_space_id === space?.id)
    ?.organizer;
});

const estaOcupada = computed(() => {
  const space = spaces.value.find((space) => space.table_name === props.mesa);

  return slots.value.some((slot) => slot.meeting_space_id === space?.id);
});
</script>

<template>
  <button
    class="mesa text-center flex align-items-center justify-content-center"
    style="cursor: pointer"
    type="button"
    @click="$emit('seleccionada')"
    :class="{
      libre: !estaOcupada,
      ocupada: estaOcupada,
      seleccionada: estaSeleccionada,
    }"
  >
    <span>{{ empresa?.company_trade_name ?? "FREE" }}</span>
  </button>
</template>

<style scoped lang="scss">
$verde: #FFD800;

.mesa {
  text-transform: uppercase;
  height: 250px;
  width: 250px;
  font-family: Barlow-Black;
  font-size: .8em;
  line-height: 1em;
  border: 0.1em solid $verde;

  > div {
    width: 80%;
    overflow: hidden;
  }
}

.ocupada {
  color: $verde;
  background: black;
}

.libre {
  background: $verde;
  color: black;
}

.seleccionada {
  background: white !important;
  color: black !important;
  border-color: white;
}
</style>
