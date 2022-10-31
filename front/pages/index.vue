<template>
  <v-container>
    <div v-if="this.$auth.loggedIn">
      <h2>ログイン済み</h2>
    </div>
    <div v-if="!this.$auth.loggedIn">
      <h2>未ログイン</h2>
    </div>
    <hr class="my-4" />
    <v-btn
      v-if="!this.$auth.loggedIn"
      variant="primary"
      to="/users/signup"
      color="red"
      >サインアップ</v-btn
    >
    <v-btn
      v-if="!this.$auth.loggedIn"
      variant="info"
      to="/users/login"
      color="yellow"
      >ログイン</v-btn
    >
    <v-btn
      v-if="this.$auth.loggedIn"
      variant="success"
      to="/users/update"
      color="blue"
      >アカウント情報変更</v-btn
    >
    <v-btn
      v-if="this.$auth.loggedIn"
      variant="danger"
      @click="logout"
      color="pink"
      >ログアウト</v-btn
    >
  </v-container>
</template>

<script>
export default {
  data: function () {
    return {};
  },
  methods: {
    async logout() {
      await this.$auth.logout().then(() => {
        localStorage.removeItem("access-token");
        localStorage.removeItem("client");
        localStorage.removeItem("uid");
        localStorage.removeItem("token-type");
      });
    },
  },
};
</script>

<style></style>
