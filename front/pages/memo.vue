<template>
  <v-card class="my-16 mx-auto pa-5" max-width="70%" outlined>
    <v-card-title>TIMER</v-card-title>
    <v-card-text>
      <v-progress-circular
        :rotate="-90"
        :size="250"
        :width="15"
        :value="100"
        color="primary"
        class="text-h2"
      >
        h
      </v-progress-circular>

      <v-progress-circular
        :rotate="-90"
        :size="250"
        :width="15"
        :value="100"
        color="red"
        class="text-h2"
      >
        {{ min }}m
      </v-progress-circular>

      <v-progress-circular
        :rotate="-90"
        :size="250"
        :width="15"
        :value="value"
        color="pink"
        class="text-h2"
      >
        {{ sec }}s
      </v-progress-circular>
    </v-card-text>
    <v-card-actions justify="center">
      <v-btn @click="start" v-if="!timerOn">Start</v-btn>
      <v-btn @click="stop" v-if="timerOn">Stop</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
// import Vue from "vue";
// import CircularCountDownTimer from "vue-circular-count-down-timer";
// Vue.use(CircularCountDownTimer);
export default {
  data() {
    return {
      interval: {},
      value: 100,
      min: 59,
      sec: 59,
      timerOn: false,
      timerObj: null,
    };
  },
  methods: {
    count: function () {
      if (this.sec <= 0 && this.min >= 1) {
        this.min--;
        this.sec = 59;
      } else if (this.sec <= 0 && this.min <= 0) {
        this.complete();
      } else {
        this.sec--;
      }
    },

    start: function () {
      let self = this;
      this.timerObj = setInterval(function () {
        self.count();
      }, 1000);
      this.interval = setInterval(() => {
        if (this.value === 0) {
          return (this.value = 100);
        } else {
          this.value -= 1.66666666667;
        }
      }, 1000);
      this.timerOn = true; //timerがONであることを状態として保持
    },

    stop: function () {
      clearInterval(this.timerObj);
      this.timerOn = false; //timerがOFFであることを状態として保持
    },

    complete: function () {
      clearInterval(this.timerObj);
    },
  },
  beforeDestroy() {
    clearInterval(this.interval);
  },
  mounted() {},
  computed: {
    formatTime: function () {
      let timeStrings = [this.min.toString(), this.sec.toString()].map(
        function (str) {
          if (str.length < 2) {
            return "0" + str;
          } else {
            return str;
          }
        }
      );
      return timeStrings[0] + ":" + timeStrings[1];
    },
  },
};
</script>

<style scoped>
.v-progress-circular {
  margin: 1rem;
}
</style>
