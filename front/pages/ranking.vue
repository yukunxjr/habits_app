<!-- <template>
  <div>
    <v-container>
      <h2>スキル入力</h2>
    </v-container>
    <v-container>
      <v-form>
        <v-row align="center">
          <v-col class="d-flex" cols="12" sm="6">
            <v-text-field
              label="スキル入力"
              v-model="name"
              required
              outlined
              maxlength="20"
            >
            </v-text-field>
          </v-col>
          <v-col class="d-flex" cols="12" sm="6">
            <v-btn class="primary" @click="addSkill">ADD</v-btn>
          </v-col>
        </v-row>
      </v-form>
    </v-container>

    <v-container>
      <v-list>
        <v-list-item v-for="skill in skills" :key="skill.id">
          <v-list-item-content>
            <v-list-item>
              {{ skill.name }}
              <v-btn @click="deleteSkill(skill.id)" class="ml-5" color="error">
                削除
              </v-btn>
            </v-list-item>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-container>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios }) {
    const data = await $axios.$get("/api/v1/skills");
    return { skills: data };
  },
  data() {
    return {
      name: "",
      skills: [],
    };
  },
  methods: {
    addSkill() {
      this.$axios
        .$post("/api/v1/skills", { name: this.name })
        .then((res) => {
          this.skills.push(res);
          this.name = "";
        })
        .catch((err) => {
          console.log(err);
        });
    },
    deleteSkill(id) {
      this.$axios
        .delete(`/api/v1/skills/${id}`)
        .then((res) => {
          // const skills = this.$parent.notes.filter((l) => l.id !== id);
          // this.$parent.notes = notes;
          location.reload();
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script> -->

<template>
  <div>
    <StudyChart />
  </div>
</template>

<script>
import StudyChart from "~/components/StudyChart.vue";

export default {
  components: {
    StudyChart,
  },
};
</script>
