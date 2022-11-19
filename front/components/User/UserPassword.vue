<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">パスワード編集</h3>
    </v-card-title>
    <v-divider></v-divider>
    <v-row class="my-8" no-gutters>
      <v-col md="5" offset-md="2">
        <v-card-text>
          <v-text-field
            v-model="oldPassword"
            prepend-icon="mdi-lock"
            label="現在のパスワード"
            :type="show1 ? 'text' : 'password'"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show1 = !show1"
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
              label="新しいパスワード"
              :type="show2 ? 'text' : 'password'"
              :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
              @click:append="show2 = !show2"
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
              label="パスワード確認"
              :type="show3 ? 'text' : 'password'"
              :append-icon="show3 ? 'mdi-eye' : 'mdi-eye-off'"
              @click:append="show3 = !show3"
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
      show1: false,
      show2: false,
      show3: false,
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
