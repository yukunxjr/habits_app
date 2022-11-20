<template>
  <v-card class="my-10 mx-auto pa-5" max-width="70%" min-height="80%" outlined>
    <v-dialog v-model="dialog" class="my-16 mx-auto pa-5" max-width="40%">
      <TimerDialog @click_submit="return_data" @click_cancel="cancel">
      </TimerDialog>
    </v-dialog>
    <v-card-title>TIMER</v-card-title>
    <v-card-text>
      <v-row class="text-center pa-15" justify="center">
        <v-col cols="12" md="2">
          <div class="text-h1" :v-model="hour">{{ hour | zeroPad }}</div>
          <div class="text-h6">hour</div>
        </v-col>
        <v-col cols="12" md="1" class="text-h1">:</v-col>
        <v-col cols="12" md="2">
          <div class="text-h1" :v-model="min">{{ min | zeroPad }}</div>
          <div class="text-h6">min</div>
        </v-col>
        <v-col cols="12" md="1" class="text-h1">:</v-col>
        <v-col cols="12" md="2">
          <div class="text-h1" :v-model="sec">{{ sec | zeroPad }}</div>
          <div class="text-h6">sec</div>
        </v-col>
      </v-row>
    </v-card-text>
    <v-card-text :v-model="saund"> サウンド：{{ saund }} </v-card-text>
    <v-card-actions justify="center">
      <v-btn @click="start" v-if="!timerOn">START</v-btn>
      <v-btn @click="stop" v-if="timerOn">STOP</v-btn>
      <v-btn @click="reset" v-if="!timerOn">RESET</v-btn>
      <v-btn @click.stop="dialog = true" v-if="!timerOn"> タイマー設定 </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import TimerDialog from "@/components/TimerDialog.vue";
import alarm1 from "@/assets/sounds/alarm1.mp3";
import alarm2 from "@/assets/sounds/alarm2.mp3";
import alarm_clock from "@/assets/sounds/alarm_clock.mp3";
import cuckoo_clock from "@/assets/sounds/cuckoo_clock.mp3";
import whisle from "@/assets/sounds/whistle.mp3";

export default {
  middleware: "auth",
  components: {
    TimerDialog,
  },
  data() {
    return {
      hour: 0,
      min: 0,
      sec: 0,
      timerOn: false,
      timerObj: null,
      dialog: false,
      saund: "アラーム１",
    };
  },
  filters: {
    // ゼロ埋めフィルタ
    zeroPad: function (value, num) {
      var num = typeof num !== "undefined" ? num : 2;
      return value.toString().padStart(num, "0");
    },
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
      if (this.sec > 0 || this.min > 0 || this.hour > 0) {
        let self = this;
        this.timerObj = setInterval(function () {
          self.count();
        }, 1000);
        this.timerOn = true;
      }
    },

    stop: function () {
      clearInterval(this.timerObj);
      this.timerOn = false;
    },

    reset: function () {
      this.hour = 0;
      this.min = 0;
      this.sec = 0;
      this.saund = "アラーム１";
    },

    complete: function () {
      clearInterval(this.timerObj);
      this.timerOn = false;
      switch (this.saund) {
        case "アラーム１":
          let audio1 = new Audio(alarm1);
          audio1.play();
          break;
        case "アラーム２":
          let audio2 = new Audio(alarm2);
          audio2.play();
          break;
        case "鳩時計":
          let audio4 = new Audio(cuckoo_clock);
          audio4.play();
          break;
        case "ホイッスル":
          let audio5 = new Audio(whisle);
          audio5.play();
          break;
        case "目覚まし時計":
          let audio6 = new Audio(alarm_clock);
          audio6.play();
          break;
      }
    },

    return_data(params) {
      this.dialog = false;
      this.hour = params.hour;
      this.min = params.min;
      this.sec = params.sec;
      this.saund = params.saund;
    },
    cancel() {
      this.dialog = false;
    },
  },
};
</script>
