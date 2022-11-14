<template>
  <v-app id="inspire">
    <v-main class="grey lighten-3 pt-10">
      <v-container>
        <v-row>
          <v-col cols="3">
            <v-sheet>
              <v-list color="transparent">
                <v-list-item two-line>
                  <v-list-item-title class="title"> MyNote </v-list-item-title>
                  <v-btn icon><v-icon>mdi-trash-can</v-icon></v-btn>
                  <v-btn icon><v-icon>mdi-folder-plus-outline</v-icon></v-btn>
                </v-list-item>

                <v-divider class="my-2"></v-divider>
                <v-list-item
                  v-for="note in notes"
                  :key="note.id"
                  @click="currentNoteId(note.title, note.body)"
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
                <v-card-title>{{ currentNoteTitle }}</v-card-title>
                <v-divider></v-divider>
                <v-card-text>{{ currentNoteBody }}</v-card-text>
              </v-container>

              <!-- <EditNote /> -->
            </v-card>
            <v-row class="justify-end mt-3">
              <v-btn class="mr-6">
                <v-icon large>mdi-pencil-circle-outline</v-icon>
                編集
              </v-btn>
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
export default {
  components: { EditNote },
  data() {
    return {
      notes: [],
      currentNoteTitle: "タイトル",
      currentNoteBody: "内容",
    };
  },
  async asyncData({ $axios }) {
    const data = await $axios.$get("/api/v1/notes");
    return { notes: data };
  },
  methods: {
    currentNoteId(title, body) {
      this.currentNoteTitle = title;
      this.currentNoteBody = body;
    },
  },
};
</script>
