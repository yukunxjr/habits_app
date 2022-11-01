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
    <!-- <v-row>
      <v-spacer></v-spacer>
      <v-col cols="12" lg="4">
        <v-row>
          <v-col
            cols="12"
            lg="7"
            class="grey--text text--darken-3 font-weight-bold pa-2 text-h6"
          >
            <p>アカウント設定</p>
          </v-col>
        </v-row>
        <v-row class="my-5">
          <v-col cols="12" lg="7" class="pa-2">
            <a
              href="/"
              class="grey--text text--darken-3 mb-1"
              @click="$auth.logout()"
            >
              ログアウト
            </a>
          </v-col>
        </v-row>
        <v-divider></v-divider>
        <v-row class="my-5">
          <v-col cols="12" lg="7" class="pa-2">
            <a
              href="#"
              class="red--text text--darken-3 mb-1"
              @click="deleteUser"
            >
              退会
            </a>
          </v-col>
        </v-row>
      </v-col>
      <v-spacer></v-spacer>
    </v-row> -->
  </v-container>
</template>

<script>
export default {
  name: "App",
  data: () => ({}),
  methods: {
    async logout() {
      await this.$auth.logout().then(() => {
        localStorage.removeItem("access-token");
        localStorage.removeItem("client");
        localStorage.removeItem("uid");
        localStorage.removeItem("token-type");
      });
    },
    deleteUser() {
      this.$axios
        .delete("api/v1/auth", {
          headers: {
            "access-token": localStorage.getItem("access-token"),
            uid: localStorage.getItem("uid"),
            client: localStorage.getItem("client"),
          },
        })
        .then((response) => {
          this.$auth.logout();
          window.location.href = "/";
        });
    },
  },
};
</script>
