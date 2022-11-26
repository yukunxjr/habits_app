<template>
  <v-app id="inspire">
    <v-main class="blue-grey lighten-5 pt-10">
      <v-row class="mx-16">
        <v-col cols="3">
          <v-sheet>
            <v-list color="transparent" class="list">
              <v-list-item two-line>
                <v-list-item-title class="title"> MyNote </v-list-item-title>
                <v-spacer></v-spacer>
                <v-dialog v-model="dialogTrashCan" width="800px">
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn icon v-bind="attrs" v-on="on">
                      <v-icon>mdi-trash-can</v-icon>
                    </v-btn>
                  </template>
                  <Trashcan
                    :delNotes="dels"
                    @click_cancel="cancel"
                    @click_reload="reload"
                  />
                </v-dialog>
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

        <!-- 現在のノート -->
        <v-col>
          <v-card min-height="74vh">
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

          <!-- 編集ボタン -->
          <v-row class="justify-end mt-3 mr-3" v-if="currentNote">
            <v-dialog v-model="dialogEdit" width="800px">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  v-bind="attrs"
                  v-on="on"
                  color="blue-grey"
                  class="mr-5 white--text"
                >
                  編集
                </v-btn>
              </template>
              <EditNote
                :note="currentNote"
                @click_cancel="cancel"
                @click_reload="reload"
              />
            </v-dialog>
            <v-btn
              @click="discardNote(currentNote.id)"
              class="white--text"
              color="blue-grey"
            >
              削除
            </v-btn>
          </v-row>
        </v-col>
      </v-row>
    </v-main>
  </v-app>
</template>

<script>
import EditNote from "@/components/Note/EditNote.vue";
import CreateNote from "@/components/Note/CreateNote.vue";
import Trashcan from "@/components/Note/Trashcan.vue";
export default {
  components: { EditNote, CreateNote, Trashcan },
  data() {
    return {
      notes: [],
      dels: [],
      dialog: false,
      dialogEdit: false,
      dialogTrashCan: false,
      currentNote: "",
    };
  },
  async asyncData({ $axios }) {
    const data = await $axios.$get("/api/v1/notes");
    const delData = await $axios.$get("/api/v1/trashcan");
    return { notes: data, dels: delData };
  },
  methods: {
    setNote(note) {
      this.currentNote = note;
      // console.log(Object.entries(this.currentNote));
    },
    cancel() {
      location.reload();
      this.dialog = false;
      this.dialogEdit = false;
      this.dialogTrashCan = false;
    },
    reload() {
      location.reload();
      this.dialog = false;
      this.dialogEdit = false;
      this.dialogTrashCan = false;
    },
    discardNote(id) {
      this.$axios
        .delete(`/api/v1/notes/${id}/discard`)
        .then((res) => {
          location.reload();
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped>
.list {
  height: 80vh;
  overflow-y: auto;
}
</style>
-->
