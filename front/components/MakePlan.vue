<template>
  <v-card height="400">
    <v-card-title class="ml-3">
      目標設定
      <v-spacer></v-spacer>
      <v-dialog v-model="dialog" width="800px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn icon v-bind="attrs" v-on="on" class="mr-5">
            <v-icon>mdi-folder-plus-outline</v-icon>
          </v-btn>
        </template>
        <v-card height="300px">
          <v-card-title class="text-h5 grey lighten-2">
            目標の設定
          </v-card-title>
          <v-card-text>
            <v-form ref="form" lazy-validation>
              <v-text-field
                v-model="content"
                required
                class="mt-15 mx-15"
                label="目標を入力してください"
                :rules="[rules.nameLength, rules.required]"
                :counter="25"
              />
            </v-form>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                class="mr-10 mt-8 white--text"
                color="blue-grey"
                @click="addPlan"
                >登録</v-btn
              >
            </v-card-actions>
          </v-card-text>
        </v-card>
      </v-dialog>
    </v-card-title>
    <v-divider></v-divider>
    <v-card-text>
      <v-list class="text-h6 list">
        <v-list-item
          v-for="plan in plans"
          :key="plan.id"
          class="mx-8 border mt-1"
        >
          {{ plan.content }}
          <v-spacer></v-spacer>
          <v-list-item-action>
            <v-row>
              <v-btn text class="blue--text" @click="deletePlan(plan.id)">
                達成
              </v-btn>
            </v-row>
          </v-list-item-action>
        </v-list-item>
      </v-list>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    userPlans: "",
  },
  data() {
    return {
      dialog: false,
      plans: this.userPlans,
      content: "",
      rules: {
        required: (value) => !!value || "入力してください",
        nameLength: (value) =>
          value.length <= 25 || "25文字以内で入力してください",
      },
    };
  },
  methods: {
    addPlan() {
      this.$axios
        .$post("/api/v1/plans", { content: this.content })
        .then((res) => {
          if (this.content.length >= 1 && this.content.length < 25) {
            this.plans.push(res);
            this.content = "";
          }
        })
        .catch((err) => {
          console.log(err);
        });
      this.dialog = false;
    },
    deletePlan(id) {
      this.$axios
        .delete(`/api/v1/plans/${id}`)
        .then(() => {
          location.reload();
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped>
.border {
  padding: 0.5em 1.5em;
  color: #5989cf;
  background: #c6e4ff;
  border-bottom: solid 6px #aac5de;
  border-radius: 9px;
}
.list {
  height: 40vh;
  overflow-y: auto;
}
</style>
