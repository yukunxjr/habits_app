<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">プロフィール</h3>
    </v-card-title>
    <v-divider></v-divider>
    <v-row class="my-15" no-gutters>
      <v-col cols="6">
        <v-card-text>
          ユーザー名 :{{ currentUser.name }} <br />
          ユーザーEmail :{{ currentUser.email }}
        </v-card-text>
      </v-col>
      <v-divider vertical></v-divider>
      <v-col cols="6"></v-col>
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
