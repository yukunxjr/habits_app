<template>
  <v-app class="mt-1">
    <v-navigation-drawer permanent left>
      <template v-slot:prepend>
        <v-list-item two-line>
          <v-list-item-title class="title"> Note </v-list-item-title>
          <v-btn icon><v-icon>mdi-trash-can</v-icon></v-btn>
          <v-btn icon><v-icon>mdi-folder-plus-outline</v-icon></v-btn>
        </v-list-item>
      </template>

      <v-divider></v-divider>

      <v-list>
        <v-list-item v-for="note in notes" :key="note.id" two-line>
          <v-list-item-content>
            <v-list-item-title>
              {{ note.title }}
            </v-list-item-title>
            <v-list-item-subtitle>{{ note.updated_at }} </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-content>
      <div>macについて</div>
      <div>macとは</div>
    </v-content>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      notes: [],
    };
  },
  async asyncData({ $axios }) {
    const data = await $axios.$get("/api/v1/notes");
    return { notes: data };
  },
};
</script>
