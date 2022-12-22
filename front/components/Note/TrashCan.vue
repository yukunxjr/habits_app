<template>
  <v-card class="trashCan">
    <v-card-title class="text-h5 grey lighten-2">
      ゴミ箱
      <v-spacer></v-spacer>
      <span>
        <v-card-actions>
          <!-- <v-btn text outlined class="mr-5">空にする</v-btn> -->
          <v-btn icon @click="cancel"><v-icon>mdi-close</v-icon> </v-btn>
        </v-card-actions>
      </span>
    </v-card-title>

    <v-card-text class="px-2 py-2">
      <v-list-item v-for="note in notes" :key="note.id">
        <span class="d-none d-sm-block mr-5">
          {{ note.updated_at | format_date }}
        </span>
        <v-list-item-content>
          <v-list-item-title>
            {{ note.title }}
          </v-list-item-title>
        </v-list-item-content>
        <v-btn
          @click="restorationNote(note.id)"
          color="blue-grey"
          class="white--text mr-3"
          small
        >
          復元
        </v-btn>
        <v-btn @click="removeNote(note.id)" class="error" small>削除</v-btn>
      </v-list-item>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    delNotes: {
      type: Array,
      default: "",
    },
  },
  data() {
    return {
      notes: this.delNotes,
    };
  },
  methods: {
    restorationNote(id) {
      this.$axios
        .$post(`/api/v1/notes/${id}/restoration`)
        .then((res) => {})
        .catch((err) => {
          console.log(err);
        });
      this.$emit("click_reload");
    },
    cancel() {
      this.$emit("click_reload");
    },
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
      this.$emit("click_reload");
    },
  },
};
</script>

<style scoped>
.trashCan {
  height: 60vh;
  overflow-y: auto;
}
</style>
