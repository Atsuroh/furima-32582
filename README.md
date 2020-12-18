# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items, purchases

## items テーブル

| Column        | Type       | Options          |
| ------------- | ---------- | ---------------- |
| product_name  | string     | null: false      |
| text          | text       | null: false      |
| category_id   | integer    | null: false      |
| status_id     | integer    | null: false      |
| burden_id     | integer    | null: false      |
| prefecture_id | integer    | null: false      |
| price         | integer    | null: false      |
| user          | references | foreign_key:true |

### Association

- belongs to :user
- has_many :comments
- has_one :purchase

## comment テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| text    | text       | null: false |
| user    | references |             |
| item    | references |             |

### Association

- belongs_to :item

## deliveries テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |
| purchase      | references | null: false |

### Association

- has_one :purchase

## purchase テーブル

| Column | Type       | Options |
| ------ | ---------- | ------- |
| user   | references |         |
| item   | references |         |

### Association

- has_one :delivery
- belongs_to :user, item