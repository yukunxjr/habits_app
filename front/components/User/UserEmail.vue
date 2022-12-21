<template>
  <v-container>
    <v-card-title class="display-1 text-h6 text-md-h5">
      アカウント編集
    </v-card-title>
    <v-divider class="mb-10 d-none d-sm-block"></v-divider>
    <v-row no-gutters class="justify-center">
      <v-col cols="12" sm="8" md="7">
        <v-card-text>
          <v-form ref="form" lazy-validation>
            <v-text-field
              v-model="user.name"
              prepend-icon="mdi-account"
              label="名前"
              :rules="[rules.nameLength, rules.required]"
            />
          </v-form>
        </v-card-text>
      </v-col>
      <v-col cols="12" sm="8" md="7">
        <v-card-text>
          <v-form ref="form">
            <v-text-field
              v-model="user.email"
              prepend-icon="mdi-email"
              label="メールアドレス"
              :rules="[rules.required, rules.email]"
            />
          </v-form>
        </v-card-text>
      </v-col>
      <v-col cols="12" sm="9">
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="blue-grey"
            class="white--text mb-5"
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
  props: {
    currentUser: "",
  },
  data() {
    return {
      user: {
        name: this.currentUser.name,
        email: this.currentUser.email,
      },
      rules: {
        required: (value) => !!value || "入力してください",
        nameLength: (value) =>
          value.length <= 20 || "20文字以内で入力してください",
        email: (value) =>
          /.+@.+\..+/.test(value) || "メールアドレスを正しく入力してください",
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
