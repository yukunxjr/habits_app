<template>
  <v-card height="400">
    <v-card-title class="ml-3"> 学習時間入力 </v-card-title>
    <v-divider></v-divider>
    <v-card-text>
      <v-form>
        <v-container>
          <v-row class="ml-10 mt-2">
            <v-col cols="3" md="7">
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
          <v-row class="ml-10">
            <v-col cols="3" md="4">
              <v-select
                label="時間"
                :items="hour"
                required
                v-model="time"
                class="text-h6"
              ></v-select>
            </v-col>
            <v-col cols="3" md="6">
              <v-select
                v-model="skill"
                label="スキル名"
                :items="skills"
                item-value="value"
                item-text="name"
                class="text-h7"
                return-object
              ></v-select>
            </v-col>
          </v-row>
          <v-row>
            <v-spacer></v-spacer>
            <v-card-actions>
              <v-btn
                @click="addStudies"
                color="blue-grey"
                class="mr-10 white--text"
              >
                登録
              </v-btn>
            </v-card-actions>
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
