<template>
  <v-container class="mb-16 mt-10">
    <v-row>
      <v-col align="center">
        <v-card hover height="150px">
          <v-card-text>
            <v-row class="mt-6">
              <v-col cols="4">
                テストさん<br />
                ランク:80Lv
              </v-col>
              <v-divider vertical></v-divider>
              <v-col cols="4">
                総ノート数<br />
                10
              </v-col>
              <v-divider vertical></v-divider>
              <v-col cols="4">
                総スキル数<br />
                10
              </v-col>
            </v-row>
          </v-card-text>
          <v-card-text></v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row class="mt-10">
      <v-col cols="12">
        <v-card height="550">
          <v-card-title>学習管理</v-card-title>
          <v-card-text>
            <v-row>
              <v-col cols="7">
                <v-card hover>
                  <v-card-title>３日間の学習時間</v-card-title>
                  <StudyChart :userStudy="studies" />
                </v-card>
              </v-col>
              <v-col cols="5">
                <v-card hover>
                  <v-card-title>学習時間</v-card-title>
                  <v-card-text>
                    <!-- <ul>
                      <li>今週:{{ studies.week }}時間</li>
                      <li>今月:{{ studies.month }}時間</li>
                      <li>総学習時間:{{ studies.all }}時間</li>
                    </ul> -->
                    <v-row>
                      <v-col cols="4">
                        今週<br />
                        <span class="ml-8">{{ studies.week }}時間</span>
                      </v-col>
                      <v-col cols="4">
                        今月<br />
                        <span class="ml-8">{{ studies.month }}時間</span>
                      </v-col>
                      <v-col cols="4">
                        総学習時間<br />
                        <span class="ml-10">{{ studies.all }}時間</span>
                      </v-col>
                    </v-row>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row class="mt-10" justify="center" align-content="center">
      <v-col cols="4">
        <StudyTime :userSkills="skills" @click_reload="reload" />
      </v-col>
      <v-col cols="8">
        <v-card height="350" hover>
          <v-card-title>目標</v-card-title>
          <v-card-text></v-card-text>
        </v-card>
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
