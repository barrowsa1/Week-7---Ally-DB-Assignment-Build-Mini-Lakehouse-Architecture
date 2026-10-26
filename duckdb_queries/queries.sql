--Query 1: Display student engagement events from September 2024
SELECT *
FROM read_csv_auto('lakehouse/engagement/year=2024/month=09/*.csv');

--Query 2: Calculate the average duration for each event type
SELECT
    event_type,
    AVG(duration_minutes) AS average_duration
FROM read_csv_auto('lakehouse/engagement/year=2024/month=*/engagement_2024_*.csv')
GROUP BY event_type
ORDER BY event_type;


--Query 3: Display workshop events at the St. Paul campus
SELECT *
FROM read_csv_auto('lakehouse/engagement/year=2024/month=*/engagement_2024_*.csv')
WHERE event_type = 'workshop'
  AND campus = 'St. Paul';


--Query 4: Count the number of engagement events at each campus
SELECT
    campus,
    COUNT(*) AS total_events
FROM read_csv_auto('lakehouse/engagement/year=2024/month=*/engagement_2024_*.csv')
GROUP BY campus
ORDER BY campus;


--Query 5: Display engagement events with an optional advisor note
SELECT
    event_id,
    student_id,
    event_type,
    campus,
    NULL AS advisor_note
FROM read_csv_auto('lakehouse/engagement/year=2024/month=*/engagement_2024_*.csv');
