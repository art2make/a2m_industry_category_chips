CREATE TABLE IF NOT EXISTS `{DB_PREFIX}category_industry_category` (
  `category_id` int(11) NOT NULL,
  `related_category_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`, `related_category_id`),
  KEY `related_category_id` (`related_category_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
