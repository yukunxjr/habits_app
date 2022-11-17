<template>
  <v-card>
    <v-list-item v-for="note in this.$parent.notes" :key="note.id" two-line>
      <v-list-item-content>
        <h2>{{ note.title }}</h2>
      </v-list-item-content>
      <v-btn class="mx-2" fab dark color="pink" @click="removeNote(note.id)">
        <v-icon>mdi-minus</v-icon>
      </v-btn>
      <v-btn class="mx-2" fab dark color="cyan" @click="$emit('set', note)">
        <v-icon>mdi-pencil</v-icon>
      </v-btn>
    </v-list-item>
  </v-card>
</template>

<script>
export default {
  methods: {
    removeNote(id) {
      this.$axios
        .delete(`/api/v1/notes/${id}`)
        .then((res) => {
          const notes = this.$parent.notes.filter((l) => l.id !== id);
          this.$parent.notes = notes;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
