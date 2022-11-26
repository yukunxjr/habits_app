<template>
  <v-container>
    <v-card width="500px" height="400px" class="mx-auto mt-15">
      <v-card-title>
        <h1 class="display-1">ログイン</h1>
      </v-card-title>
      <v-divider></v-divider>
      <v-alert dense outlined type="error" v-if="error">
        ログイン情報が正しくありません。再度お試しください。
      </v-alert>
      <v-spacer v-if="!error"></v-spacer>
      <v-card-text>
        <v-form @submit.prevent="login">
          <v-text-field
            prepend-icon="mdi-email"
            label="メールアドレス"
            type="email"
            v-model="email"
          />
          <v-text-field
            prepend-icon="mdi-lock"
            label="パスワード"
            v-model="password"
            class="mt-5"
            :type="show ? 'text' : 'password'"
            :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show = !show"
          />
          <v-card-actions>
            <v-btn block color="primary" class="white--text mt-5" type="submit">
              ログイン
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
      <v-card-text>
        アカウントをお持ちでない方は
        <nuxt-link to="/users/signup">こちら</nuxt-link>へ
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data: function () {
    return {
      email: "test5@test.com",
      password: "password",
      error: null,
      show: false,
    };
  },
  methods: {
    async login() {
      await this.$auth
        .loginWith("local", {
          data: {
            email: this.email,
            password: this.password,
          },
        })
        .then(
          (response) => {},
          (error) => {
            this.error = error.response.data.errors;
          }
        );
    },
  },
};
</script>
