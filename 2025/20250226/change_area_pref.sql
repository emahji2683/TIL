UPDATE :table_name
SET area = CASE 
  WHEN area = '東京' THEN '東京都'
  WHEN area = '大阪' THEN '大阪府'
  WHEN area = '京都' THEN '京都府'
  ELSE area || '県'
END;

UPDATE :table_name
SET website_url = NULL;
