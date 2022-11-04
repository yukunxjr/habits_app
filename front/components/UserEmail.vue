<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">アカウント編集</h3>
    </v-card-title>
    <v-row class="my-15" no-gutters>
      <v-col md="5" offset-md="2">
        <v-card-text>
          <v-form ref="form">
            <v-text-field
              v-model="user.name"
              prepend-icon="mdi-account"
              label="名前"
            />
          </v-form>
        </v-card-text>
      </v-col>
      <v-col md="5" offset-md="2">
        <v-card-text>
          <v-form ref="form">
            <v-text-field
              v-model="user.email"
              prepend-icon="mdi-email"
              label="メールアドレス"
            />
          </v-form>
        </v-card-text>
      </v-col>
      <v-col md="5" offset-md="6" class="mt-3">
        <v-card-actions>
          <v-btn
            color="light-green darken-1"
            class="white--text"
            @click="editNameEmail"
          >
            保存する
          </v-btn>
        </v-card-actions>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "App",

  data() {
    return {
      user: {
        name: "",
        email: "",
      },
    };
  },
  methods: {
    editNameEmail() {
      this.$axios
        .put("api/v1/auth", this.user, {
          headers: {
            "access-token": localStorage.getItem("access-token"),
            uid: localStorage.getItem("uid"),
            client: localStorage.getItem("client"),
          },
        })
        .then((response) => {
          localStorage.setItem(
            "access-token",
            response.headers["access-token"]
          );
          localStorage.setItem("client", response.headers.client);
          localStorage.setItem("uid", response.headers.uid);
          localStorage.setItem("token-type", response.headers["token-type"]);
          window.location.href = "/users/account";
        });
    },
  },
};
</script>
