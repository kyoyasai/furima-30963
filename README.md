# テーブル設計

## users

| Column      | Type    | Options                   |
|-------------|---------|---------------------------|
| nickname    | string  | null: false               |
| email       | string  | null: false, unique: true |
| password    | string  | null: false               |
| family_name | string  | null: false               |
| first_name  | string  | null: false               |
| family_kana | string  | null: false               |
| first_kana  | string  | null: false               |
| birth_date  | integer | null: false               |

### Association

- has_many :items
- has_many :purchases



## items

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| delivery_area | string     | null: false                    |
| delivery_time | string     | null: false                    |
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

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| postcode     | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase