<template>
  <v-card height="350" hover>
    <v-card-title> 学習時間入力 </v-card-title>
    <v-card-text>
      <v-form>
        <v-container>
          <v-row>
            <v-col cols="3" md="4">
              <v-text-field
                label="日付"
                required
                v-model="data"
                class="text-h6"
              ></v-text-field>
            </v-col>
            <v-menu offset-y top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn icon v-bind="attrs" v-on="on" class="mt-6 mr-5">
                  <v-icon>mdi-calendar</v-icon>
                </v-btn>
              </template>
              <v-date-picker v-model="data" locale="”jp-ja”"></v-date-picker>
            </v-menu>
          </v-row>
          <v-row>
            <v-col cols="3" md="3">
              <v-select
                label="時間"
                :items="hour"
                required
                v-model="time"
                class="text-h6"
              ></v-select>
            </v-col>
            <v-col cols="3" md="3">
              <v-select></v-select>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="3">
              <v-card-actions><v-btn>登録</v-btn></v-card-actions>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      show: false,
      data: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
      hour: [...Array(49)].map((v, i) => i / 2),
      time: "",
    };
  },
};
</script>
