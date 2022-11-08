<template>
  <!-- <v-sheet min-height="70vh" rounded="lg">テンプレート</v-sheet> -->
  <div>
    {{ user }}
    <v-btn @click="toShow(user.id)">{{ user.id }}</v-btn>
  </div>
</template>

<script>
export default {
  date: {},
  computed: {
    user() {
      return this.$auth.user;
    },
  },
  methods: {
    toShow(id) {
      this.$router.push(`/users/${id}`);
    },
  },
};
</script>
