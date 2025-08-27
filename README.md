
# FURIMA 

## users

| Column             | Type    | Options                              |
|--------------------|---------|--------------------------------------|
| id                 | integer | primary_key                          |
| nickname           | string  | null: false                          |
| email              | string  | null: false, unique: true            |
| encrypted_password | string  | null: false                          |
| first_name         | string  | null: false                          |
| last_name          | string  | null: false                          |
| first_name_kana    | string  | null: false                          |
| last_name_kana     | string  | null: false                          |
| birth_date         | date    | null: false                          |

**Association**
- has_many :items  
- has_many :orders  

---

## items

| Column                 | Type       | Options                                                                 |
|------------------------|------------|-------------------------------------------------------------------------|
| id                     | integer    | primary_key                                                             |
| item_name              | string     | null: false                                                             |
| item_explain           | text       | null: false                                                             |
| category_id            | references | null: false, foreign_key: true                                          |
| item_condition_id      | references | null: false, foreign_key: true                                          |
| shipping_fee_burden_id | references | null: false, foreign_key: true                                          |
| prefecture_id          | references | null: false, foreign_key: true                                          |
| shipping_lead_time_id  | references | null: false, foreign_key: true                                          |
| price                  | integer    | null: false, check: "price >= 300 AND price <= 9999999"                 |
| user_id                | references | foreign_key: true                                                       |

> 画像は Active Storage を使用（`has_one_attached :image`、モデルで必須バリデーション）

**Association**
- belongs_to :user  
- belongs_to :category  
- belongs_to :item_condition  
- belongs_to :shipping_fee_burden  
- belongs_to :prefecture  
- belongs_to :shipping_lead_time  
- has_one :order  

---

## orders

| Column  | Type       | Options                               |
|---------|------------|---------------------------------------|
| id      | integer    | primary_key                           |
| user_id | references | null: false, foreign_key: true        |
| item_id | references | null: false, foreign_key: true, unique: true |

**Association**
- belongs_to :user  
- belongs_to :item  
- has_one :shipping_address  

---

## shipping_addresses

| Column        | Type       | Options                                   |
|---------------|------------|-------------------------------------------|
| id            | integer    | primary_key                               |
| order_id      | references | null: false, foreign_key: true, unique: true |
| postal_code   | string     | null: false                               |
| prefecture_id | references | null: false, foreign_key: true            |
| city          | string     | null: false                               |
| address_line  | string     | null: false                               |
| building_name | string     |                                          |
| phone_number  | string     | null: false                               |

**Association**
- belongs_to :order  
- belongs_to :prefecture  

---

## categories (master)

| Column | Type    | Options                     |
|--------|---------|-----------------------------|
| id     | integer | primary_key                 |
| name   | text    | null: false, unique: true   |

**Association**
- has_many :items  

---

## item_conditions (master)

| Column | Type    | Options                     |
|--------|---------|-----------------------------|
| id     | integer | primary_key                 |
| name   | text    | null: false, unique: true   |

**Association**
- has_many :items  

---

## shipping_fee_burdens (master)

| Column | Type    | Options                     |
|--------|---------|-----------------------------|
| id     | integer | primary_key                 |
| name   | text    | null: false, unique: true   |

**Association**
- has_many :items  

---

## prefectures (master)

| Column | Type    | Options                     |
|--------|---------|-----------------------------|
| id     | integer | primary_key                 |
| name   | text    | null: false, unique: true   |

**Association**
- has_many :items  
- has_many :shipping_addresses  

---

## shipping_lead_times (master)

| Column | Type    | Options                     |
|--------|---------|-----------------------------|
| id     | integer | primary_key                 |
| name   | text    | null: false, unique: true   |

**Association**
- has_many :items  

---

## Index / Constraint Hints

- `users.email` → unique: true  
- `orders.item_id` → unique: true（1商品1購入）  
- `shipping_addresses.order_id` → unique: true（1注文1住所）  
- 全ての references に **foreign_key: true** を付与  
