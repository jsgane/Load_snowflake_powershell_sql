CREATE or replace TABLE neemba.core.a_bronze_ref_temps (
	tps_sk int autoincrement NOT NULL,
	tps_ak int NOT NULL,
	tps_code_annee varchar(25) NULL,
	tps_code_annee_mois varchar(6) NULL,
	tps_code_annee_mois_jour varchar(8) NULL,
	tps_code_annee_semaine varchar(6) NULL,
	tps_code_annee_semaine_iso varchar(6) NULL,
	tps_code_jour varchar(2) NULL,
	tps_code_mois varchar(2) NULL,
	tps_code_semaine varchar(2) NULL,
	tps_code_semaine_iso varchar(2) NULL,
	tps_code_semestre varchar(2) NULL,
	tps_code_trimestre varchar(2) NULL,
	tps_date_sql TIMESTAMP_NTZ NULL,
	tps_ind_dernier_jour_annee int NULL,
	tps_ind_dernier_jour_mois int NULL,
	tps_lib_jour varchar(25) NULL,
	tps_lib_mois varchar(25) NULL,
	tps_num_annee int NULL,
	tps_num_annee_mois int NULL,
	tps_num_annee_mois_jour int NULL,
	tps_num_annee_semaine int NULL,
	tps_num_annee_semaine_iso int NULL,
	tps_num_jour int NULL,
	tps_num_jour_dans_annee int NULL,
	tps_num_jour_dans_semaine int NULL,
	tps_num_mois int NULL,
	tps_num_mois_dans_trimestre int NULL,
	tps_num_mois_dans_semestre int NULL,
	tps_num_semaine int NULL,
	tps_num_semaine_iso int NULL,
	tps_num_semestre int NULL,
	tps_num_trimestre int NULL,
	tps_archivedfrom TIMESTAMP_NTZ NULL,
	tps_app_date_create date NULL,
	tps_app_date_update date NULL,
	tps_app_hour_create int NULL,
	tps_app_user varchar(20) NULL,
	tps_tch_talend_date_exec TIMESTAMP_NTZ NULL,
	tps_tch_talend_job_name varchar(50) NULL,
	tps_tch_date_create TIMESTAMP_NTZ NULL,
	tps_tch_date_update TIMESTAMP_NTZ NULL
);


-- Truncate table
TRUNCATE TABLE neemba.core.a_bronze_ref_temps;

--select * from neemba.core.a_bronze_ref_temps;


INSERT INTO neemba.core.a_bronze_ref_temps
            (tps_sk
             ,tps_ak
             ,tps_code_annee
             ,tps_code_annee_mois
             ,tps_code_annee_mois_jour
             ,tps_code_annee_semaine
             ,tps_code_annee_semaine_iso
             ,tps_code_jour
             ,tps_code_mois
             ,tps_code_semaine
             ,tps_code_semaine_iso
             ,tps_code_semestre
             ,tps_code_trimestre
             ,tps_date_sql
             ,tps_ind_dernier_jour_annee
             ,tps_ind_dernier_jour_mois
             ,tps_lib_jour
             ,tps_lib_mois
             ,tps_num_annee
             ,tps_num_annee_mois
             ,tps_num_annee_mois_jour
             ,tps_num_annee_semaine
             ,tps_num_annee_semaine_iso
             ,tps_num_jour
             ,tps_num_jour_dans_annee
             ,tps_num_jour_dans_semaine
             ,tps_num_mois
             ,tps_num_mois_dans_semestre
             ,tps_num_mois_dans_trimestre
             ,tps_num_semaine
             ,tps_num_semaine_iso
             ,tps_num_semestre
             ,tps_num_trimestre
             ,tps_archivedfrom
             ,tps_app_date_create
             ,tps_app_date_update
             ,tps_app_hour_create
             ,tps_app_user
             ,tps_tch_talend_date_exec
             ,tps_tch_talend_job_name
             ,tps_tch_date_create
             ,tps_tch_date_update)
VALUES 
(  -1, -1, NULL, '175301', '17530101', NULL, NULL, NULL, NULL, NULL, NULL,
   NULL, NULL, NULL, NULL, NULL, 'Unknown', NULL, NULL, NULL, NULL, NULL,
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
   NULL, NULL, NULL, 'Admin', NULL, NULL, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()
),
(  -2, -2, NULL, '175301', '17530102', NULL, NULL, NULL, NULL, NULL, NULL,
   NULL, NULL, NULL, NULL, NULL, 'Undefined', NULL, NULL, NULL, NULL, NULL,
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
   NULL, NULL, NULL, 'Admin', NULL, NULL, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()
);

-- Variables
SET StartDate = '2017-01-01';
SET CutoffDate = DATEADD('DAY', -1, DATEADD('YEAR', 20, $StartDate));

-- Recursive sequence of days
INSERT INTO neemba.core.a_bronze_ref_temps (
       tps_ak
      ,tps_code_annee
      ,tps_code_annee_mois
      ,tps_code_annee_mois_jour
      ,tps_code_annee_semaine
      ,tps_code_annee_semaine_iso
      ,tps_code_jour
      ,tps_code_mois
      ,tps_code_semaine
      ,tps_code_semaine_iso
      ,tps_code_semestre
      ,tps_code_trimestre
      ,tps_date_sql
      ,tps_ind_dernier_jour_annee
      ,tps_ind_dernier_jour_mois
      ,tps_lib_jour
      ,tps_lib_mois
      ,tps_num_annee
      ,tps_num_annee_mois
      ,tps_num_annee_mois_jour
      ,tps_num_annee_semaine
      ,tps_num_annee_semaine_iso
      ,tps_num_jour
      ,tps_num_jour_dans_annee
      ,tps_num_jour_dans_semaine
      ,tps_num_mois
      ,tps_num_mois_dans_semestre
      ,tps_num_mois_dans_trimestre
      ,tps_num_semaine
      ,tps_num_semaine_iso
      ,tps_num_semestre
      ,tps_num_trimestre
      ,tps_archivedFrom
      ,tps_app_date_create
      ,tps_app_date_update
      ,tps_app_hour_create
      ,tps_app_user
      ,tps_tch_talend_date_exec
      ,tps_tch_talend_job_name
      ,tps_tch_date_create
      ,tps_tch_date_update
)
WITH seq(n) AS (
  SELECT 0
  UNION ALL
  SELECT n + 1
  FROM seq
  WHERE n < DATEDIFF('DAY', $StartDate, $CutoffDate)
),
d(d) AS (
  SELECT DATEADD('DAY', n, $StartDate)
  FROM seq
),
src AS (
  SELECT 
       CAST(TO_CHAR(d, 'YYYYMMDD') AS INT) AS tps_ak,
       CAST(YEAR(d) AS VARCHAR) AS tps_code_annee,
       CAST(YEAR(d) AS VARCHAR) || LPAD(MONTH(d), 2, '0') AS tps_code_annee_mois,
       CAST(YEAR(d) AS VARCHAR) || LPAD(MONTH(d), 2, '0') || LPAD(DATE_PART('DAY', d), 2, '0') AS tps_code_annee_mois_jour,
       CAST(YEAR(d) AS VARCHAR) || LPAD(DATE_PART('WEEK', d), 2, '0') AS tps_code_annee_semaine,
       CAST(YEAR(d) AS VARCHAR) || LPAD(DATE_PART('WEEKISO', d), 2, '0') AS tps_code_annee_semaine_iso,
       LPAD(DATE_PART('DAY', d), 2, '0') AS tps_code_jour,
       LPAD(MONTH(d), 2, '0') AS tps_code_mois,
       CAST(DATE_PART('WEEK', d) AS VARCHAR) AS tps_code_semaine,
       LPAD(DATE_PART('WEEKISO', d), 2, '0') AS tps_code_semaine_iso,
       CAST(CASE WHEN DATE_PART('QUARTER', d) < 3 THEN 1 ELSE 2 END AS VARCHAR) AS tps_code_semestre,
       CAST(DATE_PART('QUARTER', d) AS VARCHAR) AS tps_code_trimestre,
       d AS tps_date_sql,
       CASE WHEN d = LAST_DAY(d) THEN 1 ELSE 0 END AS tps_ind_dernier_jour_mois,
       CASE WHEN d = DATE_FROM_PARTS(YEAR(d), 12, 31) THEN 1 ELSE 0 END AS tps_ind_dernier_jour_annee,
      CASE DATE_PART('DOW', d)
          WHEN 0 THEN 'dimanche'
          WHEN 1 THEN 'lundi'
          WHEN 2 THEN 'mardi'
          WHEN 3 THEN 'mercredi'
          WHEN 4 THEN 'jeudi'
          WHEN 5 THEN 'vendredi'
          WHEN 6 THEN 'samedi'
    END AS tps_lib_jour,
     CASE MONTH(d)
    WHEN 1 THEN 'janvier'
    WHEN 2 THEN 'février'
    WHEN 3 THEN 'mars'
    WHEN 4 THEN 'avril'
    WHEN 5 THEN 'mai'
    WHEN 6 THEN 'juin'
    WHEN 7 THEN 'juillet'
    WHEN 8 THEN 'août'
    WHEN 9 THEN 'septembre'
    WHEN 10 THEN 'octobre'
    WHEN 11 THEN 'novembre'
    WHEN 12 THEN 'décembre'
END AS tps_lib_mois,
       DATE_PART('DAY', d) AS tps_num_jour,
       DATE_PART('DAYOFYEAR', d) AS tps_num_jour_dans_annee,
       DATE_PART('DOW', d) AS tps_num_jour_dans_semaine,
       MONTH(d) AS tps_num_mois,
       CASE WHEN MONTH(d) < 7 THEN MONTH(d) ELSE MONTH(d) - 6 END AS tps_num_mois_dans_semestre,
       CASE 
         WHEN MONTH(d) < 4 THEN MONTH(d)
         WHEN MONTH(d) < 7 THEN MONTH(d) - 3
         WHEN MONTH(d) < 10 THEN MONTH(d) - 6
         ELSE MONTH(d) - 9
       END AS tps_num_mois_dans_trimestre,
       DATE_PART('WEEK', d) AS tps_num_semaine,
       DATE_PART('WEEKISO', d) AS tps_num_semaine_iso,
       CASE WHEN DATE_PART('QUARTER', d) < 3 THEN 1 ELSE 2 END AS tps_num_semestre,
       DATE_PART('QUARTER', d) AS tps_num_trimestre,
       YEAR(d) AS tps_num_annee,
       CAST(YEAR(d) || LPAD(MONTH(d), 2, '0') AS INT) AS tps_num_annee_mois,
       CAST(YEAR(d) || LPAD(MONTH(d), 2, '0') || LPAD(DATE_PART('DAY', d), 2, '0') AS INT) AS tps_num_annee_mois_jour,
       CAST(YEAR(d) || LPAD(DATE_PART('WEEK', d), 2, '0') AS INT) AS tps_num_annee_semaine,
       CAST(YEAR(d) || LPAD(DATE_PART('WEEKISO', d), 2, '0') AS INT) AS tps_num_annee_semaine_iso
  FROM d
)
SELECT 
       tps_ak
      ,tps_code_annee
      ,tps_code_annee_mois
      ,tps_code_annee_mois_jour
      ,tps_code_annee_semaine
      ,tps_code_annee_semaine_iso
      ,tps_code_jour
      ,tps_code_mois
      ,tps_code_semaine
      ,tps_code_semaine_iso
      ,tps_code_semestre
      ,tps_code_trimestre
      ,tps_date_sql
      ,tps_ind_dernier_jour_annee
      ,tps_ind_dernier_jour_mois
      ,tps_lib_jour
      ,tps_lib_mois
      ,tps_num_annee
      ,tps_num_annee_mois
      ,tps_num_annee_mois_jour
      ,tps_num_annee_semaine
      ,tps_num_annee_semaine_iso
      ,tps_num_jour
      ,tps_num_jour_dans_annee
      ,tps_num_jour_dans_semaine
      ,tps_num_mois
      ,tps_num_mois_dans_semestre
      ,tps_num_mois_dans_trimestre
      ,tps_num_semaine
      ,tps_num_semaine_iso
      ,tps_num_semestre
      ,tps_num_trimestre
      ,NULL AS tps_archivedFrom
      ,NULL AS tps_app_date_create
      ,NULL AS tps_app_date_update
      ,NULL AS tps_app_hour_create
      ,'Admin' AS tps_app_user
      ,NULL AS tps_tch_talend_date_exec
      ,NULL AS tps_tch_talend_job_name
      ,CURRENT_TIMESTAMP() AS tps_tch_date_create
      ,CURRENT_TIMESTAMP() AS tps_tch_date_update
FROM src
ORDER BY 1;


select * from neemba.core.a_bronze_ref_temps