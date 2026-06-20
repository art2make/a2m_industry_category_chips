# Developer Notes

OCMOD меняет:

- `admin/language/*/catalog/category.php`
- `admin/model/catalog/category.php`
- `admin/controller/catalog/category.php`
- `admin/view/template/catalog/category_form.twig`
- `catalog/model/catalog/category.php`
- `catalog/controller/product/category.php`

Таблица связей:

```sql
{DB_PREFIX}category_industry_category
```

Если после установки в журнале модификаторов есть `NOT FOUND`, адаптируйте соответствующий `<search>` под фактический код проекта.

Для `catalog/controller/product/category.php` используйте `regex="true"` при замене целого блока. Обычный многострочный `<search>` OpenCart не заменяет целиком: движок ищет совпадение только внутри одной строки.
