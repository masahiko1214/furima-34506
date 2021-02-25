# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| name                    | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| first_name              | string | null: false |
| last_name               | string | null: false |
| first_name_okurigana    | string | null: false |
| last_name_okurigana     | string | null: false |

### Association

- has_many :items
- has_many :purchase_records


## item テーブル

| Column                  | Type           | Options     |
| ----------------------- | -------------- | ----------- |
| items_name              | string         | null: false |
| explanation_items       | text           | null: false |
| user                    | references     | null: false |
| category                | active_hash    | null: false |
| condition               | active_hash    | null: false |
| burden                  | active_hash    | null: false |
| delivery_area           | active_hash    | null: false |
| days_to_ship            | active_hash    | null: false |
| price                   | string         | null: false |
| image                   | active_storage | null: false |

### Association

- belongs_to :user
- has_one    :purchase_record


## purchase_record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## shipping_address テーブル

| Column                  | Type           | Options     |
| ----------------------- | -------------- | ----------- |
| postal_number           | integer        | null: false |
| prefectural             | activehash     | null: false |
| municipality            | string         | null: false |
| category                | string         | null: false |
| condition               | string         |             |
| phone_number            | integer        | null: false |


### Association
- belongs_to :purchase_record