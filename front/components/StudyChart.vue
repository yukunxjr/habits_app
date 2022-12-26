<script>
import { Bar } from "vue-chartjs";
export default {
  extends: Bar,
  props: {
    userStudy: "",
  },
  data() {
    return {
      chartdata: {
        labels: ["", "一昨日", "昨日", "今日", ""],
        datasets: [
          {
            label: ["1日の学習時間合計"],
            backgroundColor: [
              "rgba(30, 150, 210, 0.8)",
              "rgba(40, 180, 230, 0.8)",
              "rgba(20, 120, 190, 0.8)",
              "rgba(0, 60, 150, 0.8)",
              "rgba(10, 90, 170, 0)",
            ],
            data: [
              0,
              this.userStudy.ago,
              this.userStudy.yesterday,
              this.userStudy.today,
              10,
            ],
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: { y: { min: 0 } },
        tooltips: {
          enabled: false,
        },
        plugins: {
          tooltip: {
            enabled: false,
          },
        },
      },
    };
  },
  mounted() {
    this.renderChart(this.chartdata, this.options);
  },
};
</script>
