<template>
  <v-app id="inspire">
    <v-main class="blue-grey lighten-5 pt-10">
      <v-row class="justify-center">
        <v-col cols="11" sm="6" md="3">
          <v-sheet>
            <v-list color="transparent" class="list">
              <v-list-item two-line>
                <v-list-item-title class="title"> MyNote </v-list-item-title>
                <v-spacer></v-spacer>
                <v-btn icon @click="changeOrderOn" v-if="!sortOn">
                  <v-icon>mdi-sort-calendar-descending</v-icon>
                </v-btn>
                <v-btn icon @click="changeOrderOff" v-if="sortOn">
                  <v-icon>mdi-sort-calendar-ascending</v-icon>
                </v-btn>
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
                <v-dialog v-model="dialogEdit" width="800px" v-if="currentNote">
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn v-bind="attrs" v-on="on" icon class="d-md-none">
                      <v-icon>mdi-pencil</v-icon>
                    </v-btn>
                  </template>
                  <EditNote
                    :note="currentNote"
                    @click_cancel="cancel"
                    @click_reload="reload"
                  />
                </v-dialog>
              </v-list-item>
              <v-divider class="my-2"></v-divider>
              <v-list-item
                v-for="note in reverseNotes"
                :key="note.id"
                @click="setNote(note)"
                two-line
              >
                <v-row class="pl-2 pr-4 nowrap">
                  <v-col cols="9" md="12">
                    <v-list-item-content>
                      <v-list-item-title>
                        {{ note.title }}
                      </v-list-item-title>
                      <v-list-item-subtitle
                        >{{ note.updated_at | format_date }}
                      </v-list-item-subtitle>
                    </v-list-item-content>
                  </v-col>

                  <!-- レスポンシブ -->
                  <v-col cols="2" class="d-md-none">
                    <v-spacer></v-spacer>
                    <v-list-item-action>
                      <v-btn
                        @click="discardNote(note.id)"
                        class="white--text mt-2"
                        color="blue-grey"
                        small
                      >
                        削除
                      </v-btn>
                    </v-list-item-action>
                  </v-col>
                </v-row>
              </v-list-item>
            </v-list>
          </v-sheet>
        </v-col>

        <!-- 現在のノート -->
        <v-col cols="7" class="d-none d-md-block">
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

          <!-- 編集、削除ボタン -->
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
import EditNoteResponsive from "@/components/Note/EditNoteResponsive.vue";
import CreateNote from "@/components/Note/CreateNote.vue";
import Trashcan from "@/components/Note/Trashcan.vue";
export default {
  components: { EditNote, EditNoteResponsive, CreateNote, Trashcan },
  data() {
    return {
      notes: [],
      dels: [],
      dialog: false,
      dialogEdit: false,
      dialogEditResponsive: false,
      dialogTrashCan: false,
      currentNote: "",
      sortOrder: 1,
      sortOn: true,
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
    changeOrderOff() {
      this.sortOrder = this.sortOrder > 0 ? -1 : 1;
      this.sortOn = false;
    },
    changeOrderOn() {
      this.sortOrder = this.sortOrder > 0 ? -1 : 1;
      this.sortOn = true;
    },
  },
  computed: {
    reverseNotes() {
      return this.notes.sort((a, b) => {
        return a.updated_at > b.updated_at
          ? -this.sortOrder
          : a.updated_at < b.updated_at
          ? this.sortOrder
          : 0;
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
.nowrap {
  white-space: nowrap;
  overflow: hidden;
}
</style>
