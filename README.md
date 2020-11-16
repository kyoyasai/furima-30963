# テーブル設計

## users

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_kana        | string  | null: false               |
| first_kana         | string  | null: false               |
| birth_date         | date    | null: false               |

### Association

- has_many :items
- has_many :purchases



## items

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase



## purchase

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address



## address

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase