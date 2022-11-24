<template>
  <v-card height="350" hover>
    <v-card-title> 学習時間入力 </v-card-title>
    <v-card-text>
      <v-form>
        <v-container>
          <v-row>
            <v-col cols="3" md="6">
              <v-text-field
                label="日付"
                required
                v-model="date"
                class="text-h6"
              ></v-text-field>
            </v-col>
            <v-menu offset-y top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn icon v-bind="attrs" v-on="on" class="mt-8 mr-5">
                  <v-icon>mdi-calendar</v-icon>
                </v-btn>
              </template>
              <v-date-picker v-model="date" locale="”jp-ja”"></v-date-picker>
            </v-menu>
          </v-row>
          <v-row>
            <v-col cols="3" md="3">
              <v-select
                label="時間"
                :items="hour"
                required
                v-model="time"
                class="text-h6"
              ></v-select>
            </v-col>
            <v-col cols="3" md="4">
              <v-select
                v-model="skill"
                label="スキル名"
                :items="skills"
                item-value="value"
                item-text="name"
                class="text-h6"
                return-object
              ></v-select>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="3">
              <v-card-actions>
                <v-btn @click="addStudies">登録</v-btn>
              </v-card-actions>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    userSkills: "",
  },
  data() {
    return {
      show: false,
      skill: "",
      skills: this.userSkills,
      date: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
      hour: [...Array(49)].map((v, i) => i / 2),
      time: "",
    };
  },
  methods: {
    addStudies() {
      this.$axios
        .$post("/api/v1/studies", {
          time: this.time,
          date: this.date,
          skill_id: this.skill.id,
        })
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
