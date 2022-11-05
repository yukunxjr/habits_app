<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">パスワード編集</h3>
    </v-card-title>
    <v-row class="my-8" no-gutters>
      <v-col md="5" offset-md="2">
        <v-card-text>
          <v-text-field
            v-model="oldPassword"
            prepend-icon="mdi-lock"
            append-icon="mdi-eye-off"
            label="現在のパスワード"
            type="password"
            :rules="[rules.required]"
          />
        </v-card-text>
      </v-col>
      <v-col md="5" offset-md="2">
        <v-card-text>
          <v-form ref="form" lazy-validation>
            <v-text-field
              v-model="user.password"
              prepend-icon="mdi-lock"
              append-icon="mdi-eye-off"
              label="新しいパスワード"
              type="password"
              :rules="[rules.required, rules.passwordLength]"
            />
          </v-form>
        </v-card-text>
      </v-col>
      <v-col md="5" offset-md="2">
        <v-card-text>
          <v-form ref="form">
            <v-text-field
              v-model="user.password_confirmation"
              prepend-icon="mdi-lock"
              append-icon="mdi-eye-off"
              label="パスワード確認"
              type="password"
              :rules="[rules.required]"
            />
          </v-form>
        </v-card-text>
      </v-col>
      <v-col md="5" offset-md="6" class="mt-3">
        <v-card-actions>
          <v-btn
            color="light-green darken-1"
            class="white--text"
            @click="editPassword"
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
  data() {
    return {
      oldPassword: "",
      user: {
        password: "",
        password_confirmation: "",
      },
      rules: {
        required: (value) => !!value || "入力してください",
        passwordLength: (value) =>
          value.length >= 6 || "パスワードは6文字以上で入力してください",
      },
    };
  },
  methods: {
    editPassword() {
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
