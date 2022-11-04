<template>
  <v-container>
    <v-card width="500px" class="mx-auto mt-10">
      <v-card-title>
        <h1 class="display-1">新規登録</h1>
      </v-card-title>
      <v-card-text>
        <v-form>
          <v-text-field
            v-model="name"
            prepend-icon="mdi-account"
            label="名前"
            type="text"
            class="mt-3"
          />
          <v-text-field
            v-model="email"
            prepend-icon="mdi-email"
            label="メールアドレス"
            type="email"
            class="mt-3"
          />
          <v-text-field
            v-model="password"
            prepend-icon="mdi-lock"
            append-icon="mdi-eye-off"
            label="パスワード"
            type="password"
            class="mt-3"
          />
          <v-text-field
            v-model="password_confirmation"
            prepend-icon="mdi-lock"
            append-icon="mdi-eye-off"
            label="パスワード確認"
            type="password"
            class="mt-3"
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
      name: "test",
      email: "test1@test.com",
      password: "password",
      password_confirmation: "password",
      error: null,
    };
  },
  methods: {
    async signup() {
      try {
        await this.$axios.post("http://localhost:3000/api/v1/auth", {
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
      } catch (e) {
        this.error = e.response.data.errors.full_messages;
      }
    },
  },
};
</script>

<style></style>
