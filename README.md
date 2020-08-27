# BlackStarWear
 Дипломная работа SkillBox "IOS-разработка для начинающих"


Скриншоты 
----------------

| <img height="500" src="https://github.com/muriginvlad/BlackStarWear/raw/master/Screenshots/Screenshot1.png" /> | <img height="500" src="https://github.com/muriginvlad/BlackStarWear/raw/master/Screenshots/Screenshot2.png" /> | <img height="500" src="https://github.com/muriginvlad/BlackStarWear/raw/master/Screenshots/Screenshot3.png" /> |
|------------|------------|------------|
|<p align="center">Категории</p>|<p align="center">Подкатегории</p>|<p align="center">Товары</p>|
||||
| <img height="500" src="https://github.com/muriginvlad/BlackStarWear/raw/master/Screenshots/Screenshot4.png" /> | <img height="500" src="https://github.com/muriginvlad/BlackStarWear/raw/master/Screenshots/Screenshot5.png" /> | <img height="500" src="https://github.com/muriginvlad/BlackStarWear/raw/master/Screenshots/Screenshot6.png" /> |
|<p align="center">Карточка товара</p>|<p align="center">Выбор размера и цвета</p>|<p align="center">Корзина</p>|





ТЗ для дипломной работы
----------------

**Экран списка категорий**
Данные (категории и подкатегории) загружаются из `http://blackstarshop.ru/index.php?route=api/v1/categories`
Нужно показать загруженные категории, по нажатию переходить на экран подкатегорий

**Экран подкатегорий**
Нужно показать подкатегории выбранной категории. По нажатию переходить на экран списка товаров

**Экран списка товаров**
Данные (товары) загружаются из `http://blackstarshop.ru/index.php?route=api/v1/products&cat_id={id категории}`
Нужно показать картинку, название и стоимость товаров. По нажатию переходить в карточку товара

 **Карточка товара**
Нужно показать галлерею фото товара, название, цену, описание, выбор цвета и размера (доступны разные размеры в зависимости от выбранного цвета)
Товар (с выбранным цветом и размером) можно положить в корзину (товары в корзине кэшируются) С этого экрана можно перейти на экран корзины

**Экран корзины**
Показывается список добавленных товаров (название, цена, картинка, цвет, размер) Товары из корзины можно удалить
