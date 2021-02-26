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
| birthday_year_id        | integer | null: false                 |
| birthday_month_id       | integer | null: false                 |
| birthday_day_id         | integer | null: false                 |


### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column                  | Type           | Options                        |
| ----------------------- | -------------- | ------------------------------ |
| items_name              | string         | null: false                    |
| explanation_items       | text           | null: false                    |
| user                    | references     | null: false, foreign_key: true |
| category_id             | integer        | null: false                    |
| condition_id            | integer        | null: false                    |
| burden_id               | integer        | null: false                    |
| delivery_area_id        | integer        | null: false                    |
| days_to_ship_id         | integer        | null: false                    |
| price                   | string         | null: false                    |

### Association

- belongs_to :user
- has_one    :purchase_record


## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## shipping_address テーブル

| Column                  | Type           | Options          |
| ----------------------- | -------------- | ---------------- |
| postal_number           | string         | null: false      |
| prefectural_id          | integer        | null: false      |
| municipality            | string         | null: false      |
| category                | string         | null: false      |
| condition               | string         |                  |
| phone_number            | integer        | null: false      |
| purchase_record         | references     | foreign_key: true|


### Association
- belongs_to :purchase_record