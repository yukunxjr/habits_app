<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">アカウント削除</h3>
    </v-card-title>
    <v-divider></v-divider>
    <v-row class="my-15" no-gutters>
      <v-col md="7" offset-md="2">
        <v-card-text class="text-h5 font-weight-bold">
          必ずご確認ください！<br />
          アカウントを削除すると、これまでのデータ（NoteやUserの情報等）はすべて削除されます。<br />
          よろしければ次へお進みください！
        </v-card-text>
      </v-col>
      <v-col md="5" offset-md="6" class="mt-3">
        <v-card-actions>
          <v-btn @click="deleteUser" depressed color="error">
            アカウントを削除する</v-btn
          >
        </v-card-actions>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data: () => ({}),
  methods: {
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
        });
    },
  },
};
</script>
