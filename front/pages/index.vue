<template>
  <v-container fluid class="ma-0 pa-0">
    <v-card height="700px" class="bgimg">
      <v-card-title
        class="justify-center text-h2 font-weight-black white--text index"
      >
        Habitsとは
      </v-card-title>
      <v-card-text
        class="text-center text-h5 white--text font-weight-bold index mt-10"
      >
        学習時間を計測・記録・管理し、勉強時間や勉強量を可視化できるアプリです!
      </v-card-text>
    </v-card>
    <v-card height="500px" color="blue lighten-5">
      <v-card-title class="justify-center text-h5 font-weight-bold pt-10">
        こんな方におすすめ！
      </v-card-title>
      <v-card-text class="text-center text-subtitle-1">
        <v-row class="black--text mt-12 mx-16">
          <v-col cols="4" align="center">
            <v-img
              v-bind:src="require('@/assets/images/top1.png')"
              class="recommendationImg"
            >
            </v-img>
            <p class="mt-5">勉強のやる気が出ないと悩んでいる人</p>
          </v-col>
          <v-col cols="4" align="center">
            <v-img
              v-bind:src="require('@/assets/images/top2.png')"
              class="recommendationImg"
            ></v-img>
            <p class="mt-5">学習効率をあげたいと思っている人</p>
          </v-col>
          <v-col cols="4" align="center">
            <v-img
              v-bind:src="require('@/assets/images/top3.png')"
              class="recommendationImg"
            ></v-img>
            <p class="mt-5">勉強を習慣化したい！けどなかなか続かない人</p>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
    <v-card color="orange lighten-4" height="200px" class="pt-8">
      <v-card-title class="justify-center red--text text-h5 font-weight-black">
        Habitsをさっそく始めましょう！
      </v-card-title>
      <v-row justify="center">
        <v-btn class="mt-5" color="error btn" large to="/users/signup"
          >今すぐ無料会員登録</v-btn
        >
      </v-row>
    </v-card>
    <v-card color="blue lighten-5" height="500px">
      <v-card-title class="justify-center text-h5 font-weight-bold pt-10">
        このアプリの使い方
      </v-card-title>
      <v-card-text class="text-subtitle-1">
        <v-row class="justify-center mt-8 mx-10">
          <v-col cols="3">
            <v-card height="220px" color="light-blue lighten-3">
              <v-card-title class="justify-center step">STEP 1</v-card-title>
              <v-card-text class="text-subtitle-1">
                目標を設定しよう！<br />
                最初はできるだけ達成しやすい目標を立てましょう！
              </v-card-text>
            </v-card>
          </v-col>
          <v-col cols="3">
            <v-card height="220px" color="light-blue lighten-3">
              <v-card-title class="justify-center step">STEP 2</v-card-title>
              <v-card-text class="text-subtitle-1">
                学習しているスキルを登録しよう！<br />
                より詳細に設定しましょう！
              </v-card-text>
            </v-card>
          </v-col>
          <v-col cols="3">
            <v-card height="220px" color="light-blue lighten-3">
              <v-card-title class="justify-center step">STEP 3</v-card-title>
              <v-card-text class="text-subtitle-1">
                タイマー機能で学習時間を計測、<br />
                ノート機能で覚えたこと、分かったことを記録しよう！<br />
                さまざまな機能活用して学習の効率化を図ろう！<br />
              </v-card-text>
            </v-card>
          </v-col>
          <v-col cols="3">
            <v-card height="220px" color="light-blue lighten-3">
              <v-card-title class="justify-center step">STEP 4</v-card-title>
              <v-card-text class="text-subtitle-1">
                学習した時間を入力し、<br />
                グラフを基に、自分の学習を見直しましょう！
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data() {
    return {};
  },
};
</script>

<style>
.bgimg {
  background-image: url("~@/assets/images/main4.jpg");
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 100%;
}
.recommendationImg {
  border-radius: 50%;
  height: 200px;
  width: 200px;
  background: white;
}
.index {
  position: relative;
  text-align: center;
  padding-top: 280px;
}
.btn {
  animation: hekomu 2s infinite;
  box-shadow: 0 3px 0 rgb(0, 0, 0, 0.3);
}
.step {
  padding: 5px;
  background-color: #64b5f6;
  color: #fff;
  position: relative;
  margin-bottom: 20px;
}
.step::after {
  content: "";
  border-color: #0d47a1 #90caf9 #fff #0d47a1;
  border-style: solid;
  border-width: 0 0 24px 24px;
  bottom: 0;
  position: absolute;
  right: 0;
}

@keyframes hekomu {
  0% {
    box-shadow: 0 3px 0 rgb(0, 0, 0, 0.3);
    top: 0px;
  }
  10% {
    box-shadow: 0 0 0 rgb(0, 0, 0, 0.3);
    top: 3px;
  }
  20% {
    box-shadow: 0 3px 0 rgb(0, 0, 0, 0.3);
    top: 0px;
  }
  30% {
    box-shadow: 0 0 0 rgb(0, 0, 0, 0.3);
    top: 3px;
  }
  40% {
    box-shadow: 0 3px 0 rgb(0, 0, 0, 0.3);
    top: 0px;
  }
}
</style>
