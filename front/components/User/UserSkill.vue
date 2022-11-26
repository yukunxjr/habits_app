<template>
  <v-container>
    <v-card-title>
      <h3 class="display-1">スキル入力</h3>
    </v-card-title>
    <v-divider></v-divider>
    <v-row>
      <v-col>
        <v-card-text>
          <v-form>
            <v-text-field
              label="スキル入力"
              v-model="name"
              required
              outlined
              maxlength="20"
              counter="20"
              class="ma-5"
            >
            </v-text-field>
          </v-form>
        </v-card-text>
      </v-col>
      <v-col>
        <v-btn color="blue-grey" class="white--text mt-11" @click="addSkill"
          >追加</v-btn
        >
      </v-col>
    </v-row>
    <v-flex offset-xs1 xs5>
      <v-card-text>
        <v-simple-table fixed-header height="250px">
          <template v-slot:default>
            <thead>
              <tr>
                <th class="text-left">Name</th>
                <th class="text-left"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="skill in skills" :key="skill.id">
                <td>{{ skill.name }}</td>
                <td>
                  <v-btn
                    @click="deleteSkill(skill.id)"
                    class="ml-5"
                    color="error"
                    small
                  >
                    削除
                  </v-btn>
                </td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>
      </v-card-text>
    </v-flex>
  </v-container>
</template>

<script>
export default {
  props: {
    userSkills: [],
  },
  data() {
    return {
      name: "",
      skills: this.userSkills,
    };
  },
  methods: {
    addSkill() {
      this.$axios
        .$post("/api/v1/skills", { name: this.name })
        .then((res) => {
          this.skills.push(res);
          this.name = "";
          this.$emit("click_reload");
        })
        .catch((err) => {
          console.log(err);
        });
    },
    deleteSkill(id) {
      this.$axios
        .delete(`/api/v1/skills/${id}`)
        .then((res) => {
          this.$emit("click_reload");
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
