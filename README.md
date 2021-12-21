
# users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| date_of_birth      | date   | null: false |

### Association

- has_many :items
- has_many :purchase_records 


# items テーブル

| Column                        | Type        | Options     |
| ----------------------------- | ----------- | ----------- |
| item_name                     | string      | null: false |
| item_explanation              | text        | null: false |
| category_id                   | integer     | null: false |
| condition_id                  | integer     | null: false |
| burden_of_shipping_charge_id  | integer     | null: false |
| shipment_source_id            | integer     | null: false |
| days_to_ship_id               | integer     | null: false |
| price                         | integer     | null: false |
| user                          | references  | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record

# purchase_records テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------  |
| user          | references | null: false,foreign_key: true |
| item          | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_record


# shipping_records テーブル

| Column                    | Type       | Options     |
| ---------------------     | ---------- | ----------- |
| post_code                 | string     | null: false |
| shipment_source_id        | integer    | null: false |
| current_city              | string     | null: false |
| house_number              | string     | null: false |
| building_name             | string     |
| telephone_number          | string     | null: false |
| purchase_record           | references | null: false,foreign_key: true |

### Association

 belongs_to :purchase_record
