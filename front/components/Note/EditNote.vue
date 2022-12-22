<template>
  <v-card>
    <v-card-title class="text-h5 grey lighten-2"> ノートの編集 </v-card-title>

    <v-card-text>
      <v-form>
        <v-text-field v-model="title" label="タイトル" class="ma-2" />
        <v-textarea
          v-model="body"
          outlined
          type="text"
          class="mx-2"
          height="300"
        />
      </v-form>
      <v-divider></v-divider>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" text @click="cancel"> キャンセル </v-btn>
        <v-btn color="primary" text @click="editNote"> 保存 </v-btn>
      </v-card-actions>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    note: {
      type: Object,
      default: "",
    },
  },
  data() {
    return {
      id: this.note.id,
      title: this.note.title,
      body: this.note.body,
    };
  },
  methods: {
    editNote() {
      this.$axios
        .$put(`/api/v1/notes/${this.id}`, {
          title: this.title,
          body: this.body,
        })
        .then((res) => {
          const notes = this.$parent.notes.map((l) => {
            return l.id === this.id ? res : l;
          });
          this.$parent.notes = notes;
        })
        .catch((err) => {
          console.log(err);
        });
      this.$emit("click_reload");
    },
    cancel() {
      this.$emit("click_cancel");
    },
  },
};
</script>
