# NHL Stanley Cup Winners Analysis (2005-06 to 2024-25)

## Executive Summary
This project analyzes NHL Stanley Cup winning teams over the past 20 seasons (2005-06 to 2024-25) to identify the key factors that separate Stanley Cup winners from other teams. Using datasets from the official NHL website, I focused on the hockey metrics GF/GP, GA/GP, PP%, PK%, Corsi, and Save%, as well as built custom metrics like the grit index and a champion profile score to uncover patterns that consistently appear in Stanley Cup winning teams.

Using Excel Power Query for data wrangling, SQL for data analysis, and Power BI to build dynamic dashboards, I discovered that having a high goal differential is the most important factor in winning the Stanley Cup. In order to achieve that, teams need to have a good balance of offense and defense. Also, playoff teams improved their grit level in the playoffs, which shows the importance of grit in the playoffs. However, the grit index is not the difference maker in winning the Stanley Cup. It is mainly the goal differential.

<img width="500" height="400" alt="image" src="https://github.com/user-attachments/assets/35a1837c-f5a4-4195-9d3d-f236d6ea6e31" />

## Business Problem
There have been teams with a high number of regular season points that end up having an early playoff exit, and teams with less than 100 points who end up winning the Stanley Cup. This raises important questions about what a Stanley Cup winner looks like. This project helps teams build their roster by prioritizing key performance areas that improve their chances of winning a championship. It explores:
- What key performance indicators distinguish Stanley Cup winning teams from other teams?
- How do some successful regular season teams end up having early playoff exits, while some average regular season teams end up winning the Stanley Cup?
- Could we build a data-driven profile of what a Stanley Cup winning team looks like?



## Methodology
1. Data collection & wrangling using Excel Power Query:
- [Excel Dataset File](https://github.com/simonhsieh999/NHL-Stanley-Cup-Winners-Analysis/blob/main/NHL_Dataset.xlsx)
- Downloaded the regular season and playoff datasets CSV files (2005-06 to 2024-25) from the official NHL website (http://NHL.com), and imported the files onto Excel Power Query.
- Cleaned, merged, and transformed the datasets.
- Added new columns like "Season Type", "Playoff Result", and "Cup Winner". Also created new custom metrics such as the grit index (consisting of the grit metrics hits, blocked shots, and takeaways) and champion profile score (consisting of playoff metrics weighted by importance).
2. Data analysis using SQL:
- [SQL File](https://github.com/simonhsieh999/NHL-Stanley-Cup-Winners-Analysis/blob/main/NHL_SQL_Codes.sql)
- Imported the cleaned Excel dataset onto SQL.
- Compared key metrics between StanleyCup winners and non-winning playoff teams using aggregate functions.
- Calculated deltas in team stats from regular season to playoffs.
- Calculated the correlations between the key metrics.
- Computed the rankings of the key metrics of Cup winning teams using window functions.
3. Dashboard creation using Power BI
- [Power BI File Link](https://github.com/simonhsieh999/NHL-Stanley-Cup-Winners-Analysis/blob/main/NHL%20Project%20Power%20BI.pbix).
- Built a multi-page interactive dashboard with the following pages:
  - An executive summary
  - Regular season vs playoff performance
  - Playoff collapses & underdog cup winners
  - Offensive breakdown
  - Defensive breakdown
  - Grit index analysis


## Skills
- Excel: Power Query, data cleaning, data transforming, and data wrangling
  
 <img width="500" height="400" alt="image" src="https://github.com/user-attachments/assets/2dd14901-8d0a-418f-b567-abd8adc2a384" />

- SQL: CTEs, joins, cases, aggregate functions, windows functions, correlation functions
  
 <img width="400" height="500" alt="image" src="https://github.com/user-attachments/assets/dd2a82cb-e06f-437d-a4a7-d81af06ab63b" />

- Power BI: Multi-page dashboards, DAX measures, slicers, buttons, charts (line, column, bar, matrices, scatterplots)

<img width="500" height="400" alt="image" src="https://github.com/user-attachments/assets/7f98e897-adec-47fb-904f-2e5abd288f69" />


## Results
- Regular season success increases the chances of playoff success, but does not guarantee a Stanley Cup win. Some teams with a high regular season point total ended up having an early playoff elimination, while some average-seeded playoff teams ended up winning the Stanley Cup.
- The goal differential is the most important factor for Stanley Cup teams. Stanley Cup winning teams have a good balance of scoring, defense, and goaltending, and are ranked top 5 of all playoff teams in those stats.
- The grit index increases during the playoffs for most teams, reflecting the rise in intensity and the importance of grit in the playoffs. However, grit alone is not the difference maker for successful teams since almost all teams improve their grit level during the playoffs.
- The most impactful component of the grit index for Stanley Cup winners is takeaways.


## Recommendations
To improve their chances of winning the Stanley Cup, NHL teams should:
- Build a well-balanced roster with strong offensive and defensive capabilities in order to maximize goal differential. Prioritize two-way forwards and defensemen who can contribute at both ends of the ice, and a solid goaltender.
- Have just enough regular season points to get into the playoffs since all playoff teams of different point totals have won the Stanley Cup.
- Increase team grit to match the playoff intensity. While teams improve their overall grit level during the playoffs, Stanley Cup winners excel particularly in takeaways.


## Next Steps
To expand and deepen this analysis, we could:
- Identify the types of players that are most correlated with Stanley Cup wins.
- Explore coaching system styles used by Stanley Cup winning teams.
- Analyze how Stanley Cup winning teams manage their salary cap effectively.












