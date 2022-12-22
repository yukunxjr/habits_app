<template>
  <v-container>
    <v-card-title class="display-1 text-h6 text-md-h5">
      アカウント削除
    </v-card-title>
    <v-divider class="mb-10 d-none d-sm-block"></v-divider>
    <v-row class="justify-center" no-gutters>
      <v-col cols="12" sm="9">
        <v-card-text class="text-h5 font-weight-bold">
          必ずご確認ください！<br />
          アカウントを削除すると、これまでのデータ（NoteやUserの情報等）はすべて削除されます。<br />
          よろしければ次へお進みください！
        </v-card-text>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="12">
        <v-card-actions>
          <v-btn @click="deleteUser" depressed color="error" class="ma-auto">
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
