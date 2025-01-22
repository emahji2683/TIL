# わかりたいコード
## psql

```
SELECT museums.*, COUNT(favorites.id) AS likes_count
FROM museums
INNER JOIN favorites ON favorites.museum_id = museums.id
GROUP BY museums.id
```
