import Vue from "vue";
import moment from "moment";

Vue.filter("format_date", function (value) {
  const date = moment(value);
  return date.format("YYYY/MM/DD HH:mm"); //formatの形式の設定
});
