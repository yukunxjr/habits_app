<template>
  <v-container>
    <v-card-title class="display-1 text-h6 text-md-h5">
      スキル設定
    </v-card-title>
    <v-divider class="mb-10 d-none d-sm-block"></v-divider>
    <v-row>
      <v-col cols="9" sm="6" offset-sm="2">
        <v-card-text>
          <v-form>
            <v-text-field
              label="スキル入力"
              v-model="name"
              required
              outlined
              maxlength="20"
              counter="20"
            >
            </v-text-field>
          </v-form>
        </v-card-text>
      </v-col>
      <v-col cols="3" sm="4">
        <v-btn color="blue-grey" class="white--text mt-6" @click="addSkill"
          >追加</v-btn
        >
      </v-col>
    </v-row>
    <v-row class="justify-center">
      <v-col cols="12" sm="8">
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
                  <td width="60%">{{ skill.name }}</td>
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
      </v-col>
    </v-row>
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
