
# FURIMA 

## users

| Column             | Type    | Options                              |
|--------------------|---------|--------------------------------------|
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

| Column                    | Type       | Options                                                                 |
|------------------------   |------------|-------------------------------------------------------------------------|
| item_name                 | string     | null: false                                                             |
| item_explain              | text       | null: false                                                             |
| category_id               | integer    | null: false                                                             |
| item_condition_id         | integer    | null: false                                                             |
| shipping_fee_burden_id    | integer    | null: false                                                             |
| prefecture_id             | integer    | null: false                                                             |
| shipping_lead_time_id     | integer    | null: false                                                             |
| price                     | integer    | null: false                                                             |
| user                      | references | null: false, foreign_key: true                                          |

> 画像は Active Storage を使用（`has_one_attached :image`、モデルで必須バリデーション）

**Association**
- belongs_to :user   
- has_one :order  

---

## orders

| Column  | Type       | Options                               |
|---------|------------|---------------------------------------|
| user    | references | null: false, foreign_key: true        |
| item    | references | null: false, foreign_key: true, unique: true |

**Association**
- belongs_to :user  
- belongs_to :item  
- has_one :shipping_address  

---

## shipping_addresses

| Column        | Type       | Options                                      |
|---------------|------------|-------------------------------------------   |
| order         | references | null: false, foreign_key: true, unique: true |
| postal_code   | string     | null: false                                  |
| prefecture_id | integer    | null: false                                  |
| city          | string     | null: false                                  |
| address_line  | string     | null: false                                  |
| building_name | string     |                                              |
| phone_number  | string     | null: false                                  |

**Association**
- belongs_to :order  
---


## Index / Constraint Hints

- `users.email` → unique: true  
- `orders.item_id` → unique: true（1商品1購入）  
- `shipping_addresses.order_id` → unique: true（1注文1住所）  
- 全ての references に **foreign_key: true** を付与  
