<template>
  <div class="all">
    <div class="wrapper">
      <div class="companies">
        <div class="company" v-for="(company, index) in companies" :key="company.id">
          <div :class="('item_' + (index + 1) )">
            <div class="name">
              {{ company.company_tradename }}
            </div>
            <div class="number">
              {{ company.meeting_count }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script setup>
import { ref, onBeforeMount } from "vue";
const runtimeConfig = useRuntimeConfig();

const BEARER_TOKEN = "Bearer 10|oNZhvGbkZE8MJdqIFs79xix6Zx8zmBrCfwfoCOjLf716dc67";

const companies = ref([]);

onBeforeMount(() => {
  // fecth Meetings
  fetchCountCompanyMeetings();
  setInterval(() => {
    // fetchCountCompanyMeetings();
  }, 3000);
});



const fetchCountCompanyMeetings = async () => {
  try {
    const data = await $fetch(
      `${runtimeConfig.public.BACKEND_SERVER_URL}/api/get-group-company-meetings`,
      {
        headers: {
          Authorization: BEARER_TOKEN,
        },
      }
    );
    companies.value = data;
    console.log("DATAAAA", data);
  } catch (error) {
    console.error("Error fetching meetings:", error);
  }
};

</script>

<style lang="scss" scoped>

.all {
  background-color: #000;
  color: #fff;
}

.wrapper {
  width: 2160px;
  height: 3840px;
  background: url("/img/ranking-bg.png");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  color: #fff;
  font-weight: 700;
}

.company {
  position: relative;
  top: 0;
  left: 0;
  .item_1, .item_2, .item_3, .item_4, .item_5 {
    position: absolute;
    left: 580px;
    width: 1210px;
    display: flex;
    justify-content: space-between;
    .name {
      font-size: 65px;
      color: #fff;
    }
    .number {
      font-size: 130px;
      line-height: 0;
      color: #000;
    }
  }
  .item_1 {
    top: 2390px;
  }
  .item_2 {
    top: 2655px;
  }
  .item_3 {
    top: 2900px;
  }
  .item_4 {
    top: 3160px;
  }
  .item_5 {
    top: 3400px;
  }
}

</style>