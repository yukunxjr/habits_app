<template>
  <v-app id="inspire">
    <v-main class="grey lighten-3 pt-10">
      <v-container>
        <v-row>
          <v-col cols="3">
            <v-sheet>
              <v-list color="transparent" class="list">
                <v-list-item two-line>
                  <v-list-item-title class="title"> MyNote </v-list-item-title>
                  <v-spacer></v-spacer>
                  <v-btn icon><v-icon>mdi-trash-can</v-icon></v-btn>
                  <v-dialog v-model="dialog" width="800px">
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn icon v-bind="attrs" v-on="on">
                        <v-icon>mdi-folder-plus-outline</v-icon>
                      </v-btn>
                    </template>
                    <CreateNote @click_cancel="cancel" @click_reload="reload" />
                  </v-dialog>
                </v-list-item>
                <v-divider class="my-2"></v-divider>
                <v-list-item
                  v-for="note in notes"
                  :key="note.id"
                  @click="setNote(note)"
                  two-line
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      {{ note.title }}
                    </v-list-item-title>
                    <v-list-item-subtitle
                      >{{ note.updated_at }}
                    </v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-sheet>
          </v-col>

          <v-col>
            <v-card min-height="70vh">
              <v-container>
                <v-card-title>
                  {{ currentNote.title || "タイトル" }}
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                  {{ currentNote.body || "内容" }}
                </v-card-text>
              </v-container>
            </v-card>
            <v-row class="justify-end mt-3">
              <v-dialog v-model="dialogEdit" width="800px" v-if="editOn">
                <template v-slot:activator="{ on, attrs }">
                  <v-btn class="mr-6" icon v-bind="attrs" v-on="on">
                    <v-icon large>mdi-pencil-circle-outline</v-icon>
                  </v-btn>
                </template>
                <EditNote
                  :note="currentNote"
                  @click_cancel="cancel"
                  @click_reload="reload"
                />
              </v-dialog>
              <v-btn>
                <v-icon large>mdi-close-circle-outline</v-icon>
                削除
              </v-btn>
            </v-row>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import EditNote from "@/components/Note/EditNote.vue";
import CreateNote from "@/components/Note/CreateNote.vue";
export default {
  components: { EditNote, CreateNote },
  data() {
    return {
      notes: [],
      dialog: false,
      dialogEdit: false,
      currentNote: "",
      editOn: false,
    };
  },
  async asyncData({ $axios }) {
    const data = await $axios.$get("/api/v1/notes");
    return { notes: data };
  },
  methods: {
    setNote(note) {
      this.currentNote = note;
      this.editOn = true;
      console.log(note);
    },
    cancel() {
      this.dialog = false;
      this.dialogEdit = false;
    },
    reload() {
      location.reload();
      this.dialog = false;
      this.dialogEdit = false;
    },
  },
};
</script>

<style scoped>
.list {
  height: 70vh;
  overflow-y: auto;
}
</style>
