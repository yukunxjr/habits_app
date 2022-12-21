<template>
  <v-container>
    <v-card-title class="display-1 text-h6 text-md-h5">
      パスワード変更
    </v-card-title>
    <v-divider class="mb-10 d-none d-sm-block"></v-divider>
    <v-row no-gutters class="justify-center">
      <v-col cols="12" sm="8" md="7">
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
      <v-col cols="12" sm="8" md="7">
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
      <v-col cols="12" sm="8" md="7">
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
      <v-col cols="12" sm="9">
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="blue-grey"
            class="white--text mb-5"
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
