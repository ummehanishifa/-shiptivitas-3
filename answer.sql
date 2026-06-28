-- PART 1: Daily average users before and after the feature change (launched 2018-06-02)
SELECT
  DATE(login_timestamp, 'unixepoch') AS day,
  COUNT(DISTINCT user_id) AS daily_active_users,
  CASE
    WHEN DATE(login_timestamp, 'unixepoch') < '2018-06-02'
    THEN 'before'
    ELSE 'after'
  END AS period
FROM login_history
GROUP BY day
ORDER BY day;

-- PART 2: Number of status changes by card
SELECT
  cardID,
  COUNT(*) AS status_changes
FROM card_change_history
WHERE oldStatus != '' AND newStatus != oldStatus
GROUP BY cardID
ORDER BY status_changes DESC;