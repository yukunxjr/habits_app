<template>
  <v-app>
    <Header />
    <v-main>
      <nuxt />
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import Header from "@/components/HeaderNav.vue"; // headerをインポート
import Footer from "@/components/Footer.vue"; // footerをインポート
export default {
  components: {
    Header,
    Footer,
  },
};
</script>
