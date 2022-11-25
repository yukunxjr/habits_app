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
              "rgba(255, 159, 64, 0.8)",
              "rgba(255, 205, 86, 0.8)",
              "rgba(54, 162, 235, 0.8)",
              "rgba(255, 99, 132, 0.8)",
              "rgba(153, 102, 255, 0.8)",
            ],
            data: [
              0,
              this.userStudy.ago,
              this.userStudy.yesterday,
              this.userStudy.today,
              0,
            ],
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
      },
    };
  },
  mounted() {
    this.renderChart(this.chartdata, this.options);
  },
};
</script>
