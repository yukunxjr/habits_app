<template>
  <v-container class="mb-16 mt-10">
    <v-row>
      <v-col align="center">
        <v-card height="150px">
          <v-card-text>
            <v-row class="mt-6">
              <v-col cols="3">

              </v-col>
              <v-divider vertical></v-divider>
              <v-col cols="3">
                現在の目標数<br />
                {{ plans.length }}
              </v-col>
              <v-divider vertical></v-divider>
              <v-col cols="3">
                総ノート数<br />
                {{ notes.length }}
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
    <v-row class="mt-10" justify="center" align-content="center">
      <v-col cols="4">
        <StudyTime :userSkills="skills" @click_reload="reload" />
      </v-col>
      <v-col cols="8">
        <MakePlan :userPlans="plans" />
      </v-col>
    </v-row>
    <v-row class="mt-10">
      <v-col cols="12">
        <v-card height="700">
          <v-card-title class="ml-3">学習管理</v-card-title>
          <v-divider></v-divider>
          <v-card-text>
            <v-row class="mt-2">
              <v-col cols="7">
                <v-card height="550px">
                  <v-card-title>３日間の学習時間</v-card-title>
                  <StudyChart :userStudy="studies" />
                </v-card>
              </v-col>
              <v-col cols="5">
                <v-card height="420px">
                  <v-card-text v-if="studies.all > 0">
                    <SkillChart
                      :skillTime="skillSumTime"
                      :userSkills="skills"
                    />
                  </v-card-text>
                </v-card>
                <ul height="90px" class="mt-3 ml-5 subtitle-1">
                  <li>
                    今週・・・・・・・・・・
                    {{ studies.week }}時間
                  </li>
                  <li>
                    今月・・・・・・・・・・
                    {{ studies.month }}時間
                  </li>
                  <li>
                    総学習時間・・・・・・・
                    {{ studies.all }}時間
                  </li>
                  <li>
                    総学習日数・・・・・・・
                    {{ studies.studiesAllDate }}日
                  </li>
                </ul>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>

  </v-container>
</template>

<script>
import StudyTime from "@/components/StudyTime.vue";
import StudyChart from "@/components/StudyChart.vue";
import SkillChart from "@/components/SkillChart.vue";
import MakePlan from "@/components/MakePlan.vue";

export default {
  async asyncData({ $axios }) {
    const userData = await $axios.$get("/api/v1/users/new");
    const skillData = await $axios.$get("/api/v1/skills");
    const studyData = await $axios.$get("/api/v1/studies");
    const noteData = await $axios.$get("/api/v1/notes");
    const planData = await $axios.$get("/api/v1/plans");
    return {
      user: userData,
      skills: skillData,
      studies: studyData,
      notes: noteData,
      plans: planData,
    };
  },
  components: {
    StudyTime,
    StudyChart,
    SkillChart,
    MakePlan,
  },
  data() {
    return {
      user: "",
      skills: "",
      studies: "",
      studiesAllDate: "",
      notes: "",
      plans: "",
      msg: [
        "勉強お疲れ様です！",
        "今日も張り切っていきましょう！",
        "スキルを磨きましょう！",
        "Let's Study!",
        "今日は勉強日和ですね！",
        "継続は力なり",
        "勉強を習慣に！",
      ],
    

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
      let top5 = [];
      let dummy = { skill_name: "-", value: 0 };

      let obj = this.studies.skill;
      let array = Object.keys(obj).map((k) => ({
        skill_name: this.skillId(Number(k)),
        value: obj[k],
      }));
      array.sort((a, b) => b.value - a.value);

      for (let i = 0; i < array.length; ++i) {
        if (top5.length > 5) {
          top5.pop();
        } else {
          top5.push(array[i]);
        }
      }
      for (let i = 0; i < 5; ++i) {
        if (top5.length < 5) {
          top5.push(dummy);
        }
      }
      return top5;
    },
    randomMsg() {
      const msgNum = Math.floor(Math.random() * this.msg.length);
      return this.msg[msgNum];
      for (let i = 0; i < 5; ++i) {
        this.top5.push(array[i]);
      }
      return this.top5;

    },
  },
};
</script>

<style scoped>
ul {
  list-style: none;
}
</style>
