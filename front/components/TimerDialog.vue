<template>
  <v-card>
    <v-card-title class="text-h4">学習時間入力</v-card-title>
    <v-divider></v-divider>
    <v-card-text class="mt-5">
      <v-container>
        <v-row>
          <v-col cols="6">
            <v-select
              label="時間"
              v-model="return_data.hour"
              required
              outlined
              class="text-h6"
              :items="hours"
            ></v-select>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="6">
            <v-select
              label="分"
              v-model="return_data.min"
              required
              outlined
              class="text-h6"
              :items="minutes"
            ></v-select>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="6">
            <v-select
              label="秒"
              v-model="return_data.sec"
              required
              outlined
              class="text-h6"
              :items="seconds"
            ></v-select>
          </v-col>
        </v-row>
        <v-divider></v-divider>
        <v-row>
          <v-col cols="8">
            <v-select
              label="サウンド"
              v-model="return_data.saund"
              required
              :items="saunds"
            ></v-select>
          </v-col>
        </v-row>
      </v-container>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn text color="success" @click="submit"> OK </v-btn>
      <v-btn text color="gray" @click="cancel"> キャンセル </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  name: "TimerDialog",
  props: {
    hour: 0,
    min: 0,
    sec: 0,
    saund: "",
  },
  data() {
    return {
      return_data: {
        hour: "",
        min: "",
        sec: "",
        saund: "",
      },
      hours: [...Array(25)].map((_, i) => i),
      minutes: [...Array(12)].map((_, i) => i * 5),
      seconds: [0, 30],
      saunds: [
        "アラーム１",
        "アラーム２",
        "目覚まし時計",
        "鳩時計",
        "ホイッスル",
      ],
    };
  },
  methods: {
    submit() {
      this.$emit("click_submit", this.return_data);
    },
    cancel() {
      this.$emit("click_cancel");
    },
  },
};
</script>
