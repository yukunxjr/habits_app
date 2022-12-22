<template>
  <v-app>
    <Header />
    <v-snackbar
      v-model="status"
      transition="slide-x-reverse-transition"
      right
      top
      :color="type"
      class="mt-16"
    >
      <div class="font-weight-bold white--text">
        {{ message }}
      </div>
    </v-snackbar>
    <v-main>
      <nuxt />
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import { mapGetters } from "vuex";
import Header from "@/components/HeaderNav.vue"; // headerをインポート
import Footer from "@/components/Footer.vue"; // footerをインポート
export default {
  components: {
    Header,
    Footer,
  },
  computed: {
    ...mapGetters({
      message: "flashMessage/message",
      type: "flashMessage/type",
      status: "flashMessage/status",
    }),
  },
};
</script>

<style>
.v-main__wrap {
  background: #eceff1;
}
</style>
