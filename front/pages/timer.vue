<template>
  <v-card class="my-16 mx-auto pa-5" max-width="70%" outlined>
    <v-card-title>TIMER</v-card-title>
    <v-card-text>
      <v-row class="text-center" justify="center">
        <v-col cols="12" md="3">
          <div
            class="pa-15 red lighten-1 rounded-circle d-inline-block text-h2"
          >
            10
          </div>
        </v-col>
        <v-col cols="12" md="3">
          <div
            class="pa-15 blue lighten-1 rounded-circle d-inline-block text-h2"
          >
            {{ min }}
          </div>
        </v-col>
        <v-col cols="12" md="3">
          <div
            class="pa-15 yellow lighten-1 rounded-circle d-inline-block text-h2"
          >
            {{ sec }}
          </div>
        </v-col>
      </v-row>
    </v-card-text>
    <v-card-actions justify="center">
      <v-btn @click="start" v-if="!timerOn">Start</v-btn>
      <v-btn @click="stop" v-if="timerOn">Stop</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  middleware: "auth",
  data() {
    return {
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
