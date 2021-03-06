# テーブル設計

## users テーブル

| Column                  | Type    | Options                     |
| ----------------------- | ------- | --------------------------- |
| name                    | string  | null: false                 |
| email                   | string  | null: false,unique: true    |
| encrypted_password      | string  | null: false                 |
| first_name              | string  | null: false                 |
| last_name               | string  | null: false                 |
| first_name_okurigana    | string  | null: false                 |
| last_name_okurigana     | string  | null: false                 |
| birthday                | date    | null: false                 |


### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column                  | Type           | Options                        |
| ----------------------- | -------------- | ------------------------------ |
| name                    | string         | null: false                    |
| explanation             | text           | null: false                    |
| user                    | references     | null: false, foreign_key: true |
| category_id             | integer        | null: false                    |
| condition_id            | integer        | null: false                    |
| burden_id               | integer        | null: false                    |
| prefecture_id           | integer        | null: false                    |
| days_to_ship_id         | integer        | null: false                    |
| price                   | integer        | null: false                    |

### Association

- belongs_to :user
- has_one    :purchase_record


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## shipping_addresses テーブル

| Column                  | Type           | Options          |
| ----------------------- | -------------- | ---------------- |
| postal_number           | string         | null: false      |
| prefecture_id           | integer        | null: false      |
| municipality            | string         | null: false      |
| address                 | string         | null: false      |
| building_name           | string         |                  |
| phone_number            | string         | null: false      |
| order                   | references     | foreign_key: true|


### Association
- belongs_to :purchase_record