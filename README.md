# テーブル設計

## Usersテーブル
| Column              | Type   | Option                    |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## Itemsテーブル
| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| responsibility_id | integer    | null: false                    |1
| prefecture_id     | integer    | null: false                    |
| day_id            | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## Purchasesテーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping

## Shippingsテーブル
| Column            | Type       | Option                        |
| ----------------- | -------    | ----------------------------- |
| postal_number     | string     | null: false                   |
| prefecture_id     | integer    | null: false                   |
| city              | string     | null: false                   |
| address           | string     | null: false                   |
| building          | string     |                               |
| phone_number      | string     | null: false                   |
| purchase          | references | null:false, foreign_key: true |

### Association
- belongs_to :purchase