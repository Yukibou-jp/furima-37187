
# users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| full_name          | string | null: false |
| full_name_kana     | string | null: false |
| date of birth      | string | null: false |

### Association

- has_many :items
- has_many :purchase info 


# items テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| item_image                 | string | null: false |
| item_name                  | string | null: false |
| item_explanation           | string | null: false |
| category                   | string | null: false |
| condition                  | string | null: false |
| Burden of shipping charges | string | null: false |
| Shipment source            | string | null: false |
| Days to ship               | string | null: false |
| price                      | string | null: false |
| user_id                    | string | null: false |

### Association

- belongs_to :user
- has_one    :purchase info

# purchase info テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| use_id             | string | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :Shipping info


# Shipping info テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post code          | string | null: false |
| Prefectures        | string | null: false |
| municipalities     | string | null: false |
| house number       | string | null: false |
| Building name      | string | null: false |
| telephone number   | string | null: false |


### Association

 belongs_to :purchase info
