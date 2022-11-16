<template>
  <v-flex>
    <v-card>
      <v-card-text>
        <v-form>
          <v-text-field v-model="title" label="title" />
          <v-text-field v-model="body" label="body" type="text" />
        </v-form>
        <v-card-actions>
          <v-btn class="mx-2" fab dark color="indigo" @click="addNote">
            <v-icon>mdi-plus</v-icon>
          </v-btn>
        </v-card-actions>
      </v-card-text>
    </v-card>
  </v-flex>
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
    },
  },
};
</script>
