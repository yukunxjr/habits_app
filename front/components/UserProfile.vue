<template>
  <!-- <v-sheet min-height="70vh" rounded="lg">テンプレート</v-sheet> -->
  <div>{{ user }}</div>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    if (!store.$auth.loggedIn) {
      redirect("/login");
    }
  },
  computed: {
    user() {
      return this.$auth.user;
    },
  },
};
</script>
