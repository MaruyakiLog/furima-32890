# テーブル設計

## Usersテーブル
| Column              | Type   | Option                    |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| real_name           | string | null: false               |
| kana                | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## Itemsテーブル
| Column             | Type       | Option                        |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null: false                   |
| description        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| responsibility_id  | integer     | null: false                   |
| delivery_source_id | integer     | null: false                   |
| days_id            | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :shipping
- has_one :purchase

## Purchasesテーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping


## Shippingsテーブル
| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal_number | string  | null: false |
| prefecture_id | string  | null: false |
| city          | string  | null: false |
| address       | text    | null: false |
| building      | text    |             |
| phone_number  | integer | null: false |

### Association
- has_many :items
- has_many :purchase
