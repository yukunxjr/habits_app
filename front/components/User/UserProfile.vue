<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">プロフィール</h3>
    </v-card-title>
    <v-divider></v-divider>
    <v-row class="my-15" no-gutters>
      <v-col md="8" offset-md="2">
        <v-card-text class="text-h5 font-weight-bold"
          >ユーザー名 :{{ currentUser.name }}</v-card-text
        >
      </v-col>
      <v-col md="8" offset-md="2">
        <v-card-text class="text-h5 font-weight-bold"
          >ユーザーID :{{ currentUser.id }}</v-card-text
        >
      </v-col>
      <v-col md="8" offset-md="2">
        <v-card-text class="text-h5 font-weight-bold"
          >ユーザーEmail :{{ currentUser.email }}</v-card-text
        >
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  props: {
    currentUser: "",
  },
  data() {
    return {
      currentUser: this.currentUser,
    };
  },
};
</script>
