<template>
  <!-- <v-sheet min-height="70vh" rounded="lg">テンプレート</v-sheet> -->
  <div>{{ user }}</div>
</template>

<script>
export default {
  date: {},
  computed: {
    user() {
      return this.$auth.user;
    },
  },
};
</script>
