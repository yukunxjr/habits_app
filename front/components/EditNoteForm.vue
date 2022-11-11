<template>
  <v-flex>
    <v-card>
      <v-card-text>
        <v-form>
          <v-text-field v-model="title" label="title" />
          <v-text-field v-model="excerpt" label="excerpt" />
        </v-form>
        <v-card-actions>
          <v-btn class="mx-2" fab dark color="teal" @click="editNote">
            <v-icon dark>mdi-pencil</v-icon>
          </v-btn>
        </v-card-actions>
      </v-card-text>
    </v-card>
  </v-flex>
</template>

<script>
export default {
  props: {
    note: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      id: this.note.id,
      title: this.note.title,
      excerpt: this.note.excerpt,
    };
  },
  methods: {
    editNote() {
      this.$axios
        .$put(`/api/v1/notes/${this.id}`, {
          title: this.title,
          excerpt: this.excerpt,
        })
        .then((res) => {
          const notes = this.$parent.notes.map((l) => {
            return l.id === this.id ? res : l;
          });
          this.$parent.notes = notes;
          this.$emit("set");
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
