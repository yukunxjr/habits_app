<script>
import { Doughnut } from "vue-chartjs";

export default {
  extends: Doughnut,
  props: {
    skillTime: "",
    skills: "",
  },
  data() {
    return {
      datas: {
        // 凡例とツールチップに表示するラベル
        labels: [
          this.skillTime[0].skill_name,
          this.skillTime[1].skill_name,
          this.skillTime[2].skill_name,
          this.skillTime[3].skill_name,
          this.skillTime[4].skill_name,
        ],
        // 表示するデータ
        datasets: [
          {
            data: [
              this.skillTime[0].value,
              this.skillTime[1].value,
              this.skillTime[2].value,
              this.skillTime[3].value,
              this.skillTime[4].value,
            ],
            backgroundColor: [
              "rgba(255, 205, 86, 0.8)",
              "rgba(255, 99, 132, 0.8)",
              "rgba(54, 162, 235, 0.8)",
              "rgba(255, 159, 64, 0.8)",
              "rgba(153, 102, 255, 0.8)",
            ],
          },
        ],
      },
      options: {
        responsive: true,
        legend: {
          position: "right",
          labels: {
            fontSize: 15,
          },
        },
      },
    };
  },
  mounted() {
    this.addPlugin({
      afterDraw(chart, go) {
        let ctx = chart.ctx;
        chart.data.datasets.forEach((dataset, i) => {
          let dataSum = 0;
          dataset.data.forEach((element) => {
            dataSum += element;
          });

          let meta = chart.getDatasetMeta(i);
          if (!meta.hidden) {
            meta.data.forEach(function (element, index) {
              // フォントの設定
              let fontSize = 10;
              let fontStyle = "normal";
              let fontFamily = "Helvetica Neue";
              ctx.fillStyle = "#000";
              // 設定を適用
              ctx.font = Chart.helpers.fontString(
                fontSize,
                fontStyle,
                fontFamily
              );

              // ラベルをパーセント表示に変更
              let labelString = chart.data.labels[index];
              let dataString = dataset.data[index].toString() + "h";

              // positionの設定
              ctx.textAlign = "center";
              ctx.textBaseline = "middle";

              let padding = -2;
              let position = element.tooltipPosition();
              // ツールチップに変更内容を表示
              ctx.fillText(
                labelString,
                position.x,
                position.y - fontSize / 2 - padding
              ); // title
              ctx.fillText(
                dataString,
                position.x,
                position.y + fontSize / 2 - padding
              ); // データの百分率

              // 凡例の位置調整
              let legend = chart.legend;
              legend.top = chart.height - legend.height / 2 - legend.top / 2;
            });
          }
        });
      },
    });
    this.renderChart(this.datas, this.options);
  },
};
</script>
