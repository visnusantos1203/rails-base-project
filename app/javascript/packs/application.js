// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import Chart from "chart.js/auto";

require("jquery");
import "bootstrap";
// require("@rails/ujs").start(); # Pag naka uncomment to hindi gumagana yung chart.js
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

Rails.start();
Turbolinks.start();
ActiveStorage.start();

let num = 98;
let ctx;

for(let i = 1; i <= num; i++){

  document.addEventListener("turbolinks:load", () => {
    ctx = document.getElementById(`myChart${i}`).getContext("2d");
    const myChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: JSON.parse(ctx.canvas.dataset.labels),
        datasets: [
          {
            label: "Price Index",
            backgroundColor: "rgba(255, 61, 133)",
            borderColor: "rgba(150, 150, 150)",
            data: JSON.parse(ctx.canvas.dataset.data),
          },
        ],
      },
      options: {
        tooltips: {
          callbacks: {
            label: function(tooltipItem) {
              return tooltipItem.yLabel;
            }
          }
        }
      }
    });
  });

};

