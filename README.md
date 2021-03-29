# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| --------            | ------ | -----------               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nickname            | string | null: false               |
| first_name          | string | null: false               |
| first_name_kana     | string | null: false               | 
| last_name           | string | null: false               |
| last_name_kana      | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_one  :buy
 
## items テーブル

| Column          | Type         | Options                        |
| ------          | ----------   | ------------------------------ |
| item_name       | string       | null: false                    |
| explanation     | text         | null: false                    |
| category_id     | integer      | null: false                    |
| status_id       | integer      | null: false                    |
| burden_id       | integer      | null: false                    |
| area_id         | integer      | null: false                    |
| shipping_day_id | integer      | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :buys

## buys テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery
 
## deliverys テーブル

| Column            | Type         | Options                        |
| ------            | ----------   | ------------------------------ |
| postal_code       | string       | null: false                    |
| area_id           | integer      | null: false                    |
| municipalities    | string       | null: false                    |
| address           | string       | null: false                    |
| building          | string       |                                |
| phone_number      | string       | null: false                    |
| buy               | references   | null: false, foreign_key: true |


### Association

- belongs_to :buy

