# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_one  :buy
 
## items テーブル

| Column       | Type         | Options                        |
| ------       | ----------   | ------------------------------ |
| item_name    | string       | null: false                    |
| image        | activestrage | null: false                    |
| explanation  | text         | null: false                    |
| category     | string       | null: false                    |
| status       | string       | null: false                    |
| burden       | stirng       | null: false                    |
| area         | string       | null: false                    |
| shipping_day | stirng       | null: false                    |
| price        | integer      | null: false                    |
| user         | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buys テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :deliverys
 
## deliverys テーブル

| Column         | Type         | Options                        |
| ------         | ----------   | ------------------------------ |
| postal_code    | integer      | null: false                    |
| prefecture     | string       | null: false                    |
| municipalities | string       | null: false                    |
| address        | string       | null: false                    |
| phone_number   | integer      | null: false                    |
| buy            | references   | null: false, foreign_key: true |


### Association

- belongs_to :buy

