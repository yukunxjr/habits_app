<template>
  <v-container class="mb-16 mt-10">
    <v-row>
      <v-col cols="12">
        <v-card height="550">
          <v-card-title>学習管理</v-card-title>
          <v-card-text>
            <v-row>
              <v-col cols="6">
                <v-card hover>
                  <v-card-title>今週の学習時間</v-card-title>
                  <StudyChart :userStudy="studies" />
                </v-card>
              </v-col>
              <v-col cols="6">
                <v-card hover>
                  <v-card-title>学習時間</v-card-title>
                  <v-card-text>
                    <ul>
                      <li>今週:{{ studies.week }}時間</li>
                      <li>今月:{{ studies.month }}時間</li>
                      <li>総学習時間:{{ studies.all }}時間</li>
                    </ul>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="6">
        <v-card height="300" hover>
          <v-card-title> スキル編集 </v-card-title>
          <v-card-text></v-card-text>
        </v-card>
      </v-col>
      <v-col cols="6">
        <StudyTime :userSkills="skills" @click_reload="reload" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import StudyTime from "@/components/StudyTime.vue";
import StudyChart from "@/components/StudyChart.vue";

export default {
  async asyncData({ $axios }) {
    const skillData = await $axios.$get("/api/v1/skills");
    const studyData = await $axios.$get("/api/v1/studies");
    return { skills: skillData, studies: studyData };
  },
  components: {
    StudyTime,
    StudyChart,
  },
  data() {
    return {
      skills: "",
      studies: "",
    };
  },
  methods: {
    reload() {
      location.reload();
    },
  },
};
</script>
