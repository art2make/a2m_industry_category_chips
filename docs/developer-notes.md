# Технические заметки

## Что добавляет модуль

Модуль добавляет таблицу:

```sql
{DB_PREFIX}category_industry_category
```

Поля:

- `category_id` - категория, на странице которой выводится блок.
- `related_category_id` - категория, которая выводится в блоке.
- `sort_order` - порядок вывода.

## Точки интеграции

OCMOD меняет следующие файлы:

- `admin/language/ru-ru/catalog/category.php`
- `admin/language/en-gb/catalog/category.php`
- `admin/model/catalog/category.php`
- `admin/controller/catalog/category.php`
- `admin/view/template/catalog/category_form.twig`
- `catalog/model/catalog/category.php`
- `catalog/controller/product/category.php`

## Логика витрины

В `catalog/controller/product/category.php` стандартный список подкатегорий заменяется на:

```php
$results = $this->model_catalog_category->getIndustryCategories($category_id);
```

Каждый элемент получает:

- `thumb` - изображение категории, если оно есть;
- `name` - название с количеством товаров, если включен `config_product_count`;
- `href` - ссылка на реальный полный `path` выбранной категории.

Это сохраняет совместимость с шаблоном UniShop2 `category-list`.

## Миграция БД

В модели есть ленивое создание таблицы через `CREATE TABLE IF NOT EXISTS`. Это позволяет установить OCMOD без отдельного SQL-шага.

Для строгого деплоя можно выполнить `sql/install.sql` вручную, заменив `{DB_PREFIX}` на префикс базы данных.

## Адаптация под кастомные проекты

Если проект уже сильно изменен другими OCMOD-модификаторами, могут не сработать поисковые фрагменты в `install.xml`. В этом случае:

1. Установите модификатор на тестовой копии.
2. Обновите модификаторы.
3. Проверьте журнал `Расширения -> Модификаторы`.
4. Если есть ошибка `NOT FOUND`, измените соответствующий `<search>` в `install.xml` под фактический код проекта.

Особенно часто конфликтуют:

- `catalog/controller/product/category.php` из-за фильтров и SEO-модулей;
- `admin/view/template/catalog/category_form.twig` из-за дополнительных вкладок;
- `admin/model/catalog/category.php` из-за модулей массового редактирования или SEO.


## Автор модуля - art2make
По всем вопросам можно обращаться на 03@art2make.ru
