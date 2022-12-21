<template>
  <v-card class="mt-10 mx-auto timer" outlined>
    <v-dialog v-model="dialog" class="mx-auto" max-width="600px">
      <TimerDialog
        @click_submit="return_data"
        @click_cancel="cancel"
        class="timer-dialog"
      >
      </TimerDialog>
    </v-dialog>
    <v-card-text class="mt-10">
      <v-row class="text-center" justify="center">
        <v-col cols="3" md="3">
          <div class="timer-num" :v-model="hour">{{ hour | zeroPad }}</div>
          <div class="timer-moment">hour</div>
        </v-col>
        <v-col cols="1" md="1" class="timer-other">:</v-col>
        <v-col cols="3" md="3">
          <div class="timer-num" :v-model="min">{{ min | zeroPad }}</div>
          <div class="timer-moment">min</div>
        </v-col>
        <v-col cols="1" md="1" class="timer-other">:</v-col>
        <v-col cols="3" md="3">
          <div class="timer-num" :v-model="sec">{{ sec | zeroPad }}</div>
          <div class="timer-moment">sec</div>
        </v-col>
      </v-row>
    </v-card-text>
    <v-row justify="center" align-content="center" class="mt-10">
      <v-card-actions>
        <v-btn
          @click="start"
          v-if="!timerOn"
          color="blue-grey"
          class="mr-5 white--text btn"
          large
        >
          スタート
        </v-btn>
        <v-btn
          @click="stop"
          v-if="timerOn"
          color="blue-grey"
          class="white--text btn"
          large
        >
          ストップ
        </v-btn>
        <v-btn
          @click="reset"
          v-if="!timerOn"
          color="blue-grey"
          class="mr-5 white--text btn"
          large
        >
          リセット
        </v-btn>
        <v-btn
          @click.stop="dialog = true"
          v-if="!timerOn"
          color="blue-grey"
          class="white--text btn"
          large
        >
          タイマー設定
        </v-btn>
      </v-card-actions>
    </v-row>
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

<style scoped>
.timer {
  width: 100%;
  padding: 20px 0 15px;
}
.timer-num {
  font-size: 50px;
}
.timer-moment {
  margin-top: 20px;
}
.btn {
  margin-bottom: 30px;
}
.timer-other {
  font-size: 50px;
}
@media screen and (min-width: 600px) {
  /* 600px以上に適用されるCSS（タブレット用） */
  .timer {
    padding: 50px 20px 50px;
    width: 90%;
  }
  .timer-num {
    font-size: 80px;
  }
  .btn {
    margin-top: 20px;
  }
}
@media screen and (min-width: 960px) {
  /* 960px以上に適用されるCSS（PC用） */
  .timer {
    padding: 80px 80px 80px;
    width: 90%;
  }
  .timer-num {
    font-size: 120px;
  }
  .timer-moment {
    margin-top: 50px;
    font-size: 20px;
  }

  .btn {
    width: 120px;
  }
}
@media screen and (min-width: 1200px) {
  /* 1200px以上に適用されるCSS（大型PC用） */
  .timer {
    padding: 140px 80px 100px;
    width: 70%;
  }
  .timer-num {
    font-size: 150px;
  }
  .timer-moment {
    font-size: 30px;
    margin: 80px 0 0;
  }
  .timer-other {
    font-size: 120px;
  }
  .btn {
    margin-top: 30px;
    width: 120px;
  }
}
</style>
