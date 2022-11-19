<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">プロフィール</h3>
    </v-card-title>
    <v-row class="my-8" no-gutters>
      <v-col md="5" offset-md="2">
        <v-card-text>ユーザー名 :{{ currentUser.name }}</v-card-text>
      </v-col>
      <v-col md="5" offset-md="2">
        <v-card-text>ユーザーID :{{ currentUser.id }}</v-card-text>
      </v-col>
      <v-col md="5" offset-md="2">
        <v-card-text>ユーザーEmail :{{ currentUser.email }}</v-card-text>
      </v-col>
      <v-col md="5" offset-md="6" class="mt-3"> </v-col>
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
