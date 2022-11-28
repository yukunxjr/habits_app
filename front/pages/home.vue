<template>
  <v-container class="mb-16 mt-10">
    <v-row>
      <v-col align="center">
        <v-card hover height="150px">
          <v-card-text>
            <v-row class="mt-6">
              <v-col cols="3">
                テストさん<br />
                ランク:80Lv
              </v-col>
              <v-divider vertical></v-divider>
              <v-col cols="3">
                達成した目標数<br />
                10
              </v-col>
              <v-divider vertical></v-divider>
              <v-col cols="3">
                総ノート数<br />
                10
              </v-col>
              <v-divider vertical></v-divider>
              <v-col cols="3">
                総学習時間<br />
                {{ studies.all }}時間
              </v-col>
            </v-row>
          </v-card-text>
          <v-card-text></v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row class="mt-10">
      <v-col cols="12">
        <v-card height="700">
          <v-card-title>学習管理</v-card-title>
          <v-card-text>
            <v-row>
              <v-col cols="7">
                <v-card hover height="480px">
                  <v-card-title>３日間の学習時間</v-card-title>
                  <StudyChart :userStudy="studies" />
                </v-card>
              </v-col>
              <v-col cols="5">
                <v-card hover height="480px">
                  <v-card-title>学習時間TOP5</v-card-title>
                  <v-card-text>
                    <SkillChart
                      :skillTime="skillSumTime"
                      :userSkills="skills"
                    />
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>
            <v-row>
              <v-col align="center">
                <ul>
                  <li>
                    今週・・・・・・・・・・
                    {{ studies.week }}時間
                  </li>
                  <li>
                    今月・・・・・・・・・・
                    {{ studies.month }}時間
                  </li>
                  <li>
                    総学習時間・・・・・・・・
                    {{ studies.all }}時間
                  </li>
                </ul>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row class="mt-10" justify="center" align-content="center">
      <v-col cols="4">
        <StudyTime :sills="skills" @click_reload="reload" />
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
import SkillChart from "@/components/SkillChart.vue";

export default {
  async asyncData({ $axios }) {
    const skillData = await $axios.$get("/api/v1/skills");
    const studyData = await $axios.$get("/api/v1/studies");
    return { skills: skillData, studies: studyData };
  },
  components: {
    StudyTime,
    StudyChart,
    SkillChart,
  },
  data() {
    return {
      skills: "",
      studies: "",
      top5: [],
    };
  },
  methods: {
    reload() {
      location.reload();
    },
    skillId(n) {
      let result = this.skills.find((u) => u.id === n);
      return result.name;
    },
  },
  computed: {
    skillSumTime() {
      let obj = this.studies.skill;
      let array = Object.keys(obj).map((k) => ({
        skill_name: this.skillId(Number(k)),
        value: obj[k],
      }));
      array.sort((a, b) => b.value - a.value);
      for (let i = 0; i < 5; ++i) {
        this.top5.push(array[i]);
      }
      return this.top5;
    },
  },
};
</script>
