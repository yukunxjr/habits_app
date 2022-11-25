<script>
import { Bar } from "vue-chartjs";
export default {
  extends: Bar,
  data() {
    return {
      chartdata: {
        labels: ["日", "月", "火", "水", "木", "金", "土"],
        datasets: [
          {
            label: ["Data"],
            backgroundColor: "#f87979",
            data: [40, 20, 12, 39, 10, 40, 39],
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
