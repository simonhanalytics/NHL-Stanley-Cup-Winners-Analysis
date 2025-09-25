--- IMPORTING THE NHL EXCEL DATASET ONTO SQL ---

CREATE TABLE nhl_team_stats (
    team VARCHAR(100),
    season VARCHAR(20),
    season_type VARCHAR(30),
    gp INT,
    w INT,
    l INT,
    ot FLOAT,
    p INT,
    p_percent FLOAT,
    reg_wins INT,
    reg_ot_wins INT,
    shootout_wins INT,
    gf INT,
    ga INT,
    gf_per_gp FLOAT,
    ga_per_gp FLOAT,
    gd_per_gp FLOAT,
    pp_pct FLOAT,
    pk_pct FLOAT,
    net_pp_pct FLOAT,
    net_pk_pct FLOAT,
    sf_per_gp FLOAT,
    sa_per_gp FLOAT,
    faceoff_pct FLOAT,
    hits INT,
    hits_per_60 FLOAT,
    blocked_shots INT,
    blocked_shots_per_60 FLOAT,
    giveaways INT,
    giveaways_per_60 FLOAT,
    takeaways INT,
    takeaways_per_60 FLOAT,
    empty_net_goals INT,
    missed_shots INT,
    save_pct FLOAT,
    playoff_Result VARCHAR(50),
    grit_index FLOAT,
    champion_profile_score FLOAT,
    cup_winner BOOLEAN
);

COPY nhl_team_stats
FROM 'C:\Users\simon\OneDrive\Documents\Desktop\NHL PROJECT\NHL_Dataset.csv'
DELIMITER ','
CSV HEADER;


--- COMPUTING THE AVERAGES & STANDARD DEVIATIONS OF EACH METRIC ---

-- Averages
SELECT
    cup_winner,
    season_type,
    ROUND(AVG(hits_per_60)::NUMERIC, 2) AS avg_hits,
    ROUND(AVG(blocked_shots_per_60)::NUMERIC, 2) AS avg_blocked_shots,
    ROUND(AVG(takeaways_per_60)::NUMERIC, 2) AS avg_takeaways,
    ROUND(AVG(grit_index)::NUMERIC, 2) AS avg_grit_index,
    ROUND(AVG(gf_per_gp)::NUMERIC, 2) AS avg_gf_per_gp,
    ROUND(AVG(ga_per_gp)::NUMERIC, 2) AS avg_ga_per_gp,
    ROUND(AVG(gd_per_gp)::NUMERIC, 2) AS avg_gd_per_gp,
    ROUND(AVG(pp_pct)::NUMERIC, 2) AS avg_pp_pct,
    ROUND(AVG(pk_pct)::NUMERIC, 2) AS avg_pk_pct,
    ROUND(AVG(faceoff_pct)::NUMERIC, 2) AS avg_faceoff_pct,
    ROUND(AVG(save_pct)::NUMERIC, 3) AS avg_save_pct,
    ROUND(AVG(corsi_pct)::NUMERIC, 2) AS avg_corsi,
    ROUND(AVG(cps_with_corsi)::NUMERIC, 2) AS avg_cps
FROM nhl_team_stats
WHERE
    playoff_result NOT IN ('Missed Playoffs', 'Qualifying Round')
GROUP BY
    cup_winner,
    season_type
ORDER BY
    2 DESC, 1 DESC

-- Standard Deviation
SELECT
    cup_winner,
    season_type,
    ROUND(STDDEV_SAMP(gf_per_gp)::NUMERIC, 2) AS stddev_gf_per_gp,
    ROUND((STDDEV_SAMP(gf_per_gp)/AVG(gf_per_gp))::NUMERIC, 2) AS rsd_gf_per_gp,
    ROUND(STDDEV_SAMP(ga_per_gp)::NUMERIC, 2) AS stddev_ga_per_gp,
    ROUND((STDDEV_SAMP(ga_per_gp)/AVG(ga_per_gp))::NUMERIC, 2) AS rsd_ga_per_gp,
    ROUND(STDDEV_SAMP(gd_per_gp)::NUMERIC, 2) AS stddev_gd_per_gp,
    ROUND((STDDEV_SAMP(gd_per_gp)/AVG(gd_per_gp))::NUMERIC, 2) AS rsd_gd_per_gp,
    ROUND(STDDEV_SAMP(pp_pct)::NUMERIC, 2) AS stddev_pp_pct,
    ROUND((STDDEV_SAMP(pp_pct)/AVG(pp_pct))::NUMERIC, 2) AS rsd_pp_pct,
    ROUND(STDDEV_SAMP(pk_pct)::NUMERIC, 2) AS stddev_pk_pct,
    ROUND((STDDEV_SAMP(pk_pct)/AVG(pk_pct))::NUMERIC, 2) AS rsd_pk_pct,
    ROUND(STDDEV_SAMP(faceoff_pct)::NUMERIC, 2) AS stddev_faceoff_pct,
    ROUND((STDDEV_SAMP(faceoff_pct)/AVG(faceoff_pct))::NUMERIC, 2) AS rsd_faceoff_pct,
    ROUND(STDDEV_SAMP(save_pct)::NUMERIC, 2) AS stddev_save_pct,
    ROUND((STDDEV_SAMP(save_pct)/AVG(save_pct))::NUMERIC, 2) AS rsd_save_pct
FROM
    nhl_team_stats
WHERE
    playoff_result NOT IN ('Missed Playoffs', 'Qualifying Round')
GROUP BY
    cup_winner,
    season_type
ORDER BY
    1 DESC, 2


--- PLAYOFF ROUND METRICS AVERAGES

SELECT
    DISTINCT(playoff_result)
FROM
    nhl_team_stats

SELECT
    playoff_result,
    CASE 
        WHEN playoff_result = 'First Round' THEN 1
        WHEN playoff_result = 'Second Round' THEN 2
        WHEN playoff_result = 'Conference Finals' THEN 3
        WHEN playoff_result = 'Finals' THEN 4
        WHEN playoff_result = 'Won Cup' THEN 5
        ELSE 0
    END AS playoff_num,
    ROUND(AVG(hits_per_60)::NUMERIC, 2) AS po_avg_hits,
    ROUND(AVG(blocked_shots_per_60)::NUMERIC, 2) AS po_avg_blocked_shots,
    ROUND(AVG(takeaways_per_60)::NUMERIC, 2) AS po_avg_takeaways,
    ROUND(AVG(grit_index)::NUMERIC, 2) AS po_avg_grit_index,
    ROUND(AVG(gf_per_gp)::NUMERIC, 2) AS po_avg_gf_per_gp,
    ROUND(AVG(ga_per_gp)::NUMERIC, 2) AS po_avg_ga_per_gp,
    ROUND(AVG(gd_per_gp)::NUMERIC, 2) AS po_avg_gd_per_gp,
    ROUND(AVG(pp_pct)::NUMERIC, 2) AS po_avg_pp_pct,
    ROUND(AVG(pk_pct)::NUMERIC, 2) AS po_avg_pk_pct,
    ROUND(AVG(faceoff_pct)::NUMERIC, 2) AS po_avg_faceoff_pct,
    ROUND(AVG(save_pct)::NUMERIC, 3) AS po_avg_save_pct,
    ROUND(AVG(corsi_pct)::NUMERIC, 2) AS po_avg_corsi,
    ROUND(AVG(cps_with_corsi)::NUMERIC, 2) AS po_avg_cps
FROM
    nhl_team_stats
WHERE
    season_type = 'Playoffs' AND
    playoff_result != 'Qualifying Round'
GROUP BY
    1
ORDER BY 2


--- REGULAR SEASON VS PLAYOFFS ---

--- Average regular season points for each playoff result
SELECT
    playoff_result,
    ROUND(AVG(p)::NUMERIC, 2) AS avg_points,
    ROUND((STDDEV_SAMP(p))::NUMERIC, 2) AS stddev_points,
    ROUND((STDDEV_SAMP(p)/AVG(p))::NUMERIC, 2) AS rsd_points
FROM
    nhl_team_stats
WHERE
    season_type = 'Regular Season' AND
    playoff_result NOT IN ('Missed Playoffs', 'Qualifying Round') AND
    season NOT IN ('2012–13', '2019–20', '2020–21')
GROUP BY 1
ORDER BY 2 DESC

--- Top 3 teams with the highest regular season points, but got eliminated in the first round

WITH top3 AS (
    SELECT
        team,
        season,
        p
    FROM
        nhl_team_stats
    ORDER BY
        p DESC
    LIMIT 3
),
rs AS(
    SELECT season, team,
        gf_per_gp AS rs_gf,
        ga_per_gp AS rs_ga,
        gd_per_gp AS rs_gd,
        pp_pct AS rs_pp,
        pk_pct AS rs_pk,
        save_pct AS rs_sv,
        corsi_pct AS rs_corsi,
        grit_index AS rs_grit
    FROM nhl_team_stats
    WHERE season_type = 'Regular Season'
),
po AS(
    SELECT season, team,
        gf_per_gp AS po_gf,
        ga_per_gp AS po_ga,
        gd_per_gp AS po_gd,
        pp_pct AS po_pp,
        pk_pct AS po_pk,
        save_pct AS po_sv,
        corsi_pct AS po_corsi,
        grit_index AS po_grit
    FROM nhl_team_stats
    WHERE season_type = 'Playoffs'
)

SELECT
    t.team, t.season, t.p AS points,
    rs_gf, po_gf, (po_gf-rs_gf) AS d_gf,
    rs_ga, po_ga, (po_ga-rs_ga) AS d_ga,
    rs_gd, po_gd, (po_gd-rs_gd) AS d_gd,
    rs_pp, po_pp, (po_pp-rs_pp) AS d_pp,
    rs_pk, po_pk, (po_pk-rs_pk) AS d_pk,
    rs_sv, po_sv, (po_sv-rs_sv) AS d_sv,
    rs_corsi, po_corsi, (po_corsi-rs_corsi) AS d_corsi,
    rs_grit, po_grit, (po_grit-rs_grit) AS d_grit
FROM top3 t
JOIN rs ON rs.season = t.season AND rs.team = t.team
JOIN po ON po.season = t.season AND po.team = t.team
ORDER BY t.season


--- Cup winners with average regular season points

WITH underdogs AS(
    SELECT
        team,
        season,
        p
    FROM
        nhl_team_stats
    WHERE
        season_type = 'Regular Season' AND
        cup_winner = TRUE AND
        season NOT IN ('2012–13', '2019–20', '2020–21') AND
        p < 100
), 
rs AS(
    SELECT season, team,
        gf_per_gp AS rs_gf,
        ga_per_gp AS rs_ga,
        gd_per_gp AS rs_gd,
        pp_pct AS rs_pp,
        pk_pct AS rs_pk,
        save_pct AS rs_sv,
        corsi_pct AS rs_corsi,
        grit_index AS rs_grit
    FROM nhl_team_stats
    WHERE season_type = 'Regular Season'
),
po AS(
    SELECT season, team,
        gf_per_gp AS po_gf,
        ga_per_gp AS po_ga,
        gd_per_gp AS po_gd,
        pp_pct AS po_pp,
        pk_pct AS po_pk,
        save_pct AS po_sv,
        corsi_pct AS po_corsi,
        grit_index AS po_grit
    FROM nhl_team_stats
    WHERE season_type = 'Playoffs'
)

SELECT u.team, u.season, u.p AS points,
    rs_gf, po_gf, (po_gf-rs_gf) AS d_gf,
    rs_ga, po_ga, (po_ga-rs_ga) AS d_ga,
    rs_gd, po_gd, (po_gd-rs_gd) AS d_gd,
    rs_pp, po_pp, (po_pp-rs_pp) AS d_pp,
    rs_pk, po_pk, (po_pk-rs_pk) AS d_pk,
    rs_sv, po_sv, (po_sv-rs_sv) AS d_sv,
    rs_corsi, po_corsi, (po_corsi-rs_corsi) AS d_corsi,
    rs_grit, po_grit, (po_grit-rs_grit) AS d_grit
FROM underdogs u
JOIN rs ON rs.season = u.season AND rs.team = u.team
JOIN po ON po.season = u.season AND po.team = u.team
ORDER BY u.season


--- METRICS RANKING OF ALL CUP WINNERS IN EACH SEASON ---

WITH rank_table AS(
    SELECT
        team,
        season,
        cup_winner,
        hits_per_60,
        RANK() OVER (PARTITION BY season ORDER BY hits_per_60 DESC) AS hits_rank,
        blocked_shots_per_60,
        RANK() OVER (PARTITION BY season ORDER BY blocked_shots_per_60 DESC) AS blocked_shots_rank,
        takeaways_per_60,
        RANK() OVER (PARTITION BY season ORDER BY takeaways_per_60 DESC) AS takeaways_rank,
        grit_index,
        RANK() OVER (PARTITION BY season ORDER BY grit_index DESC) AS grit_index_rank,
        gf_per_gp,
        RANK() OVER (PARTITION BY season ORDER BY gf_per_gp DESC) AS gf_rank,
        ga_per_gp,
        RANK() OVER (PARTITION BY season ORDER BY ga_per_gp) AS ga_rank,
        gd_per_gp,
        RANK() OVER (PARTITION BY season ORDER BY gd_per_gp DESC) AS gd_rank,
        save_pct,
        RANK() OVER (PARTITION BY season ORDER BY save_pct DESC) AS save_pct_rank,
        corsi_pct,
        RANK() OVER (PARTITION BY season ORDER BY corsi_pct DESC) AS corsi_rank,
        cps_with_corsi,
        RANK() OVER (PARTITION BY season ORDER BY cps_with_corsi DESC) AS cps_rank
    FROM
        nhl_team_stats
    WHERE
        season_type = 'Playoffs'
)
SELECT
    AVG(hits_rank) AS avg_hits_rank,
    AVG(blocked_shots_rank) AS avg_blocked_shots_rank,
    AVG(takeaways_rank) AS avg_takeaways_rank,
    AVG(grit_index_rank) AS avg_grit_index_rank,
    AVG(gf_rank) AS avg_gf_rank,
    AVG(ga_rank) AS avg_ga_rank,
    AVG(gd_rank) AS avg_gd_rank,
    AVG(save_pct_rank) AS avg_save_pct_rank,
    AVG(corsi_rank) AS avg_corsi_rank,
    AVG(cps_rank) AS avg_cps_rank
FROM
    rank_table
WHERE
    cup_winner = TRUE


--- CORRELATIONS

SELECT
    corr(corsi_pct, gd_per_gp) AS corsi_vs_gd,
    corr(gf_per_gp, gd_per_gp) AS gf_vs_gd,
    corr(ga_per_gp, gd_per_gp) AS ga_vs_gd,
    corr(save_pct, ga_per_gp) AS savepct_vs_ga,
    corr(gd_per_gp, p) AS gd_vs_pts,
    corr(gd_per_gp, cup_winner::int) AS gd_vs_cupwin,
    corr(corsi_pct, gf_per_gp) AS corsi_vs_gf,
    corr(corsi_pct, ga_per_gp) AS corsi_vs_ga,
    corr(corsi_pct, p) AS corsi_vs_pts,
    corr(sf_per_gp, gf_per_gp) AS sf_vs_gf,
    corr(sa_per_gp, ga_per_gp) AS sa_vs_ga,
    corr(corsi_pct, save_pct) AS corsi_vs_savepct,
    corr(pp_pct, gf_per_gp) AS pp_vs_gf,
    corr(pk_pct, ga_per_gp) AS pk_vs_ga,
    corr(pp_pct, p) AS pp_vs_p,
    corr(pk_pct, cup_winner::int) AS pk_vs_cupwin,
    corr(pp_pct, cup_winner::int) AS pp_vs_cupwin,
    corr(corsi_pct, takeaways_per_60) AS corsi_vs_takeaways,
    corr(takeaways_per_60, cup_winner::INT) AS takeaways_vs_cupwin
FROM
    nhl_team_stats
WHERE
    season_type = 'Playoffs'