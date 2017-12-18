var query = `query User {
  user(login: "drewandre") {
    login
      repositories(last: 100) {
        nodes {
          name
          languages(last: 10) {
            edges {
              node {
                color
                name
              }
              size
            }
            totalSize
          }
        }
      }
    }
  }`;

function updateLanguageSize(lang, languagesData) {
	languagesData.find(item => {
		if (item.name === lang.node.name) {
			return (item.size += lang.size);
		}
	});
	return languagesData;
}

function convertBytesToPercentages(languagesData) {
	languagesData.forEach(language => {
		language.size = Math.round(
			language.size / languagesData[languagesData.length - 1] * 100
		).toString();
	});
	return languagesData;
}

fetch("https://api.github.com/graphql", {
	method: "POST",
	body: JSON.stringify({ query: query }),
	headers: {
		"User-Agent": "drewandre",
		Authorization: `bearer ${GITHUB_OAUTH}`,
		"Content-Type": "application/graphql"
	}
})
	.then(response => {
		if (response.ok) {
			return response.json();
		} else {
			return Promise.reject("Could not load GitHub repository languages");
		}
	})
	.then(response => {
		var languagesData = [];
		var languageNames = [];
		var languageTotalBytes = 0;
		response.data.user.repositories.nodes.forEach(repo => {
			languageTotalBytes += repo.languages.totalSize;
			repo.languages.edges.forEach(lang => {
				if (languageNames.includes(lang.node.name)) {
					updateLanguageSize(lang, languagesData);
				} else {
					languagesData.push({
						name: lang.node.name,
						color: lang.node.color,
						size: lang.size
					});
				}
				languageNames.push(lang.node.name);
			});
		});
		languagesData.push(languageTotalBytes);
		languageBreakdowns = convertBytesToPercentages(languagesData);
		drawLanguageData(languageBreakdowns);
	})
	.catch(error => console.log("error: ", error));

function drawLanguageData(languageData) {
	var languagePercentages = [];
	var languageNames = [];
	var languageColors = [];

	for (var i = 0, len = languageData.length - 1; i < len; i++) {
		languagePercentages.push(languageData[i].size);
		languageNames.push(languageData[i].name);
		languageColors.push(languageData[i].color);
	}
	var ctx = document.getElementById("language-data").getContext("2d");
	var myChart = new Chart(ctx, {
		type: "bar",
		data: {
			labels: languageNames,
			datasets: [
				{
					data: languagePercentages,
					backgroundColor: "#6CA8AB",
					borderColor: "rgba(0,0,0,0.2)",
					borderWidth: "1"
				}
			]
		},
		options: {
			scales: {
				yAxes: [
					{
						gridLines: {
							display: false,
							drawBorder: false
						},
						display: false
					}
				],
				xAxes: [
					{
						gridLines: {
							display: false,
							drawBorder: false
						}
					}
				]
			},
			legend: { display: false },
			title: {
				display: true,
				position: "bottom",
				fontSize: 15,
				text: "GitHub Language Breakdown"
			},
			animation: {
				duration: 0,
				onComplete: function() {
					// render the value of the chart above the bar
					var ctx = this.chart.ctx;
					ctx.font = Chart.helpers.fontString(
						Chart.defaults.global.defaultFontSize,
						"normal",
						Chart.defaults.global.defaultFontFamily
					);
					ctx.fillStyle = this.chart.config.options.defaultFontColor;
					ctx.textAlign = "center";
					ctx.textBaseline = "bottom";
					this.data.datasets.forEach(function(dataset) {
						for (var i = 0; i < dataset.data.length; i++) {
							var model =
								dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model;
							ctx.fillText(dataset.data[i] + "%", model.x, model.y - 5);
						}
					});
				}
			},
			layout: {
				padding: {
					left: 0,
					right: 0,
					top: 25,
					bottom: 20
				}
			}
		}
	});
}
