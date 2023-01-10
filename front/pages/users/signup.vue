<template>
  <v-container>
    <v-card width="500px" class="mx-auto mt-10">
      <v-card-title>
        <h1 class="display-1">新規登録</h1>
      </v-card-title>
      <v-divider></v-divider>
      <v-spacer v-if="!error"></v-spacer>
      <v-alert dense outlined type="error" v-if="error">
        登録に失敗しました。お手数ですが再度お試しください。
      </v-alert>
      <v-card-text>
        <v-form lazy-validation>
          <v-text-field
            v-model="name"
            prepend-icon="mdi-account"
            label="名前"
            type="text"
            :rules="[rules.nameLength, rules.required]"
          />
          <v-text-field
            v-model="email"
            prepend-icon="mdi-email"
            label="メールアドレス"
            type="email"
            class="mt-3"
            :rules="[rules.required, rules.email]"
          />
          <v-text-field
            v-model="password"
            prepend-icon="mdi-lock"
            label="パスワード"
            class="mt-3"
            :type="show2 ? 'text' : 'password'"
            :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show2 = !show2"
            :rules="[rules.required, rules.passwordLength]"
          />
          <v-text-field
            v-model="password_confirmation"
            prepend-icon="mdi-lock"
            label="パスワード確認"
            class="mt-3"
            :type="show1 ? 'text' : 'password'"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show1 = !show1"
            :rules="[rules.required]"
          />
          <v-btn
            color="blue darken-3"
            block
            class="white--text mt-3"
            @click="signup"
          >
            送信
          </v-btn>
        </v-form>
      </v-card-text>
      <v-card-text>
        アカウントをお持ちの方は
        <nuxt-link to="/users/login">こちら</nuxt-link>へ
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data: function () {
    return {
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
      show1: false,
      show2: false,
      valid: true,
      error: null,
      rules: {
        required: (value) => !!value || "入力してください",
        nameLength: (value) =>
          value.length <= 20 || "20文字以内で入力してください",
        email: (value) =>
          /.+@.+\..+/.test(value) || "メールアドレスを正しく入力してください",
        passwordLength: (value) =>
          value.length >= 6 || "パスワードは6文字以上で入力してください",
      },
    };
  },
  methods: {
    async signup() {
      try {
        await this.$axios.post("/api/v1/auth", {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        });
        await this.$auth.loginWith("local", {
          data: {
            email: this.email,
            password: this.password,
          },
        });
        this.$store.dispatch(
          "flashMessage/showMessage",
          {
            message: "初めまして！一緒に学習していきましょう！",
            type: "primary",
            status: true,
          },
          { root: true }
        );
      } catch (e) {
        this.error = e.response.data.errors.full_messages;
        this.$store.dispatch(
          "flashMessage/showMessage",
          {
            message: this.error.join(),
            type: "error",
            status: true,
          },
          { root: true }
        );
      }
    },
  },
};
</script>

<style></style>
