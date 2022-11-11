<template>
  <div>{{ user }}</div>
</template>

<script>
export default {
  async asyncData({ $axios }) {
    await this.$axios.$get("/api/v1/users/show");
    return { user };
  },
};
</script>
