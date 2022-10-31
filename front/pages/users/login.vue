<template>
  <v-container>
    <v-card width="400px" class="mx-auto mt-5">
      <v-card-title>
        <h1 class="display-1">ログイン</h1>
      </v-card-title>
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
            append-icon="mdi-eye-off"
            label="パスワード"
            v-model="password"
            type="password"
          />
          <v-card-actions>
            <v-btn
              block
              color="light-green darken-1"
              class="white--text"
              type="submit"
            >
              ログイン
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
      <!-- <Notification :message="error" v-if="error" class="mb-4 pb-3" /> -->
    </v-card>
  </v-container>
</template>

<script>
export default {
  data: function () {
    return {
      email: "",
      password: "",
      error: null,
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
