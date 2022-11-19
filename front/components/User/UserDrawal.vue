<!-- <template>
  <v-container>
    <v-row>
      <v-spacer></v-spacer>
      <v-col cols="12" lg="4">
        <v-row>
          <v-col
            cols="12"
            lg="7"
            class="grey--text text--darken-3 font-weight-bold pa-2 text-h6"
          >
            <p>アカウント設定</p>
          </v-col>
        </v-row>
        <v-row class="my-5">
          <v-col cols="12" lg="7" class="pa-2">
            <a
              href="#"
              class="red--text text--darken-3 mb-1"
              @click="deleteUser"
            >
              退会
            </a>
          </v-col>
          <v-col cols="12" lg="5" class="pa-2 text-right">
            <font-awesome-icon icon="angle-right" />
          </v-col>
        </v-row>
      </v-col>
      <v-spacer></v-spacer>
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
          // window.location.href = "/";
        });
    },
  },
};
</script> -->

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
          <v-btn @click="deleteUser"> アカウントを削除する</v-btn>
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
