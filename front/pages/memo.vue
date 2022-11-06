<template>
  <v-card class="my-16 mx-auto pa-5" max-width="70%" outlined>
    <v-card-title>TIMER</v-card-title>
    <v-card-text>
      <v-row class="text-center pa-15" justify="center">
        <v-col cols="12" md="2">
          <div class="text-h1">{{ hour }}</div>
          <div class="text-h6">hour</div>
        </v-col>
        <v-col cols="12" md="1" class="text-h1">:</v-col>
        <v-col cols="12" md="2">
          <div class="text-h1">{{ min }}</div>
          <div class="text-h6">min</div>
        </v-col>
        <v-col cols="12" md="1" class="text-h1">:</v-col>
        <v-col cols="12" md="2">
          <div class="text-h1">{{ sec }}</div>
          <div class="text-h6">sec</div>
        </v-col>
      </v-row>
    </v-card-text>
    <v-card-actions justify="center">
      <v-btn @click="start" v-if="!timerOn">START</v-btn>
      <v-btn @click="stop" v-if="timerOn">STOP</v-btn>
      <v-btn @click="reset" v-if="!timerOn">RESET</v-btn>
      <v-btn @click="overlay = !overlay" v-if="!timerOn">タイマー設定</v-btn>
    </v-card-actions>
    <v-overlay :z-index="zIndex" :value="overlay">
      <v-btn class="white--text" color="teal" @click="overlay = false">
        close
      </v-btn>
    </v-overlay>
  </v-card>
</template>

<script>
export default {
  middleware: "auth",
  data() {
    let num = 0;
    let zero = ("00" + num).slice(-2);
    return {
      hour: zero,
      min: zero,
      sec: zero,
      timerOn: false,
      timerObj: null,
      overlay: false,
      zIndex: 0,
    };
  },
  methods: {
    count: function () {
      if (this.sec <= 0 && this.min >= 1) {
        this.min--;
        this.sec = 59;
      } else if (this.sec <= 0 && this.min <= 0 && this.hour >= 1) {
        this.hour--;
        this.min = 59;
        this.sec = 59;
      } else if (this.sec <= 0 && this.min <= 0 && this.hour <= 0) {
        this.complete();
      } else {
        this.sec--;
      }
    },

    start: function () {
      let self = this;
      this.timerObj = setInterval(function () {
        self.count();
      }, 100);
      this.timerOn = true;
    },

    stop: function () {
      clearInterval(this.timerObj);
      this.timerOn = false;
    },

    reset: function () {
      this.hour = 0;
      this.min = 0;
      this.sec = 0;
    },

    timeSet: function () {},

    complete: function () {
      clearInterval(this.timerObj);
    },
  },
};
</script>
