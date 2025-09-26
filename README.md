# NHL Stanley Cup Winners Analysis (2005-06 to 2024-25)

## Executive Summary
This project analyzes 20 seasons of NHL Stanley Cup winning teams (2005-06 to 2024-25) to discover what common factors set Stanley Cup winners apart from other teams. Using datasets from the official NHL website, I focused on the hockey metrics GF/GP, GA/GP, PP%, PK%, Corsi, and Save%, as well as built custom metrics like the grit index and a champion profile score to identify patterns that consistently appear in Stanley Cup winning teams.

Using Excel Power Query for data wrangling, SQL for data analysis, and Power BI to build dynamic dashboards, I discovered that having a high goal differential is the most important factor in winning the Stanley Cup. In order to achieve that, teams need to have a good balance of offense and defense. Also, teams in the playoffs tend to have a higher grit index than in the regular season, which shows that the team's level of grit is necessary in the playoffs. However, the grit index is not the difference maker in winning the Stanley Cup. It is mainly the defensive performance.

## Business Problem
It can be tricky to predict which teams would win the Stanley Cup since there have been teams with a high number of regular season points that end up having an early playoff exist, but teams with less than 100 points who end up winning the Stanley Cup. This project helps teams forecast success and prioritize key performance areas when building their teams. It explores:
- What key performance indicators distinguish Stanley Cup winning teams from other teams?
- How do some successful regular season teams end up having early playoff exists, while some average regular season teams end up winning the Stanley Cup?
- Could we build a data-driven profile of what a Stanley Cup winning team looks like?



## Methodology
1. Data collection & wrangling using Excel Power Query:
- [Excel Dataset File](https://github.com/simonhsieh999/NHL-Stanley-Cup-Winners-Analysis/blob/main/NHL_Dataset.xlsx)
- Downloaded the regular season and playoff datasets CSV files (2005-06 to 2024-25) from the official NHL website (http://NHL.com), and imported the files onto Excel Power Query.
- Cleaned, merged, and transformed the datasets.
- Added new columns like "Season Type", "Playoff Result", and "Cup Winner". Also created new custom metrics such as the grit index (consisting of the grit metrics hits, blocked shots, and takeaways) and champion profile score (consisting of playoff metrics weighted by importance).
2. Data analysis using SQL:
- [SQL File](https://github.com/simonhsieh999/NHL-Stanley-Cup-Winners-Analysis/blob/main/NHL_SQL_Codes.sql)
- Imported the cleaned dataset onto SQL.
- Conducted a comparison of the key metrics between Cup winners and other playoff teams.
- Calculated deltas in team stats from regular season to playoffs.
- Calculated the correlations between the key metrics.
- Computed the rankings of the key metrics of Cup winning teams.
3. Dashboard creation using Power BI ([Power BI File Link](https://github.com/simonhsieh999/NHL-Stanley-Cup-Winners-Analysis/blob/main/NHL%20Project%20Power%20BI.pbix)). Built a 6-page Power BI report with:
- An executive summary
- Regular season vs playoff performance
- Playoff collapses & underdog cup winners
- Offensive breakdown
- Defensive breakdown
- Grit index analysis


## Skills
- Excel: Power Query, data cleaning, data transforming, and data wrangling
- SQL: CTEs, joins, cases, aggregate functions, windows functions, correlation functions
- Power BI: Multi-page dashboards, DAX measures, slicers, buttons, charts (line, column, bar, matrices, scatterplots)


## Results
- Having a strong regular season performance improves the team's chances of winning the Stanley Cup. However, it is not a guarantee since some teams with a high number of regular season points have faced an early playoff exit, while some playoff teams with an average number of regular season points have won the Stanley Cup.
- The goal differential is the most important factor for Stanley Cup teams. Stanley Cup winning teams have a good balance of scoring and defensive/goaltending, and are ranked top 5 of all playoff teams in those stats.
- Teams in the playoffs improve their grit index due to the level of intensity, which shows that the grit index is necessary to be successful in the playoffs and win the Stanley Cup. However, it is not the difference maker with all teams in general improving their grit index.
- The key component of the grit index for Stanley Cup winners is takeaways.


## Recommendations
- In order for teams to improve their chances of winning the Stanley Cup, they should:
- Focus on having a good balance of scoring and defense/goaltending in order to have a high goal differential. Good idea to have 2-way forwards and defensemen that can contribute both offensively and defensively
- Have just enough regular season points to get into the playoffs since all playoff teams of different point levels have a good chance of winning the Stanley Cup
- Have enough grit to withstand the playoff intensity

## Next Steps
- In order to improve this analysis even further, we could:
- Do an analysis on player performance to identify the players who made a big impact in winning the Stanley Cup, and to figure out the traits of a player necessary to improve the chances of winning the Stanley Cup
- Investigate the type of successful coaching systems

- Investigate how management manages the salary cap to ice a successful team
