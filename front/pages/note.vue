<template>
  <div class="home">
    <template v-if="editTargetNote">
      <EditNoteForm :note="editTargetNote" @set="editingNote" />
    </template>
    <template v-else>
      <NewNoteForm />
      <NotesContainer @set="editingNote" />
    </template>
  </div>
</template>

<script>
import NotesContainer from "@/components/NotesContainer.vue";
import NewNoteForm from "@/components/NewNoteForm.vue";
import EditNoteForm from "@/components/EditNoteForm.vue";

export default {
  components: {
    NotesContainer,
    NewNoteForm,
    EditNoteForm,
  },
  data() {
    return {
      notes: [],
      editTargetNote: "",
    };
  },
  async asyncData({ $axios }) {
    const data = await $axios.$get("/api/v1/notes");
    return { notes: data };
  },
  methods: {
    editingNote(note = "") {
      this.editTargetNote = note;
    },
  },
};
</script>

<style lang="scss" scoped>
.home {
  width: 100vw;
}

.flex {
  margin-bottom: 2rem;
}
</style>
