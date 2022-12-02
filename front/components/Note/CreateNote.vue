<template>
  <v-card>
    <v-card-title class="text-h5 grey lighten-2">
      ノートの新規作成
    </v-card-title>

    <v-card-text>
      <v-form>
        <v-text-field v-model="title" label="タイトル" class="ma-5" />
        <v-textarea
          v-model="body"
          outlined
          type="text"
          class="mx-5"
          height="300"
          :counter="1000"
        />
      </v-form>
      <v-divider></v-divider>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" text @click="cancel"> キャンセル </v-btn>
        <v-btn color="primary" text @click="addNote"> 保存 </v-btn>
      </v-card-actions>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      title: "",
      body: "",
    };
  },
  methods: {
    addNote() {
      this.$axios
        .$post("/api/v1/notes", { title: this.title, body: this.body })
        .then((res) => {
          this.$parent.notes.push(res);
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
