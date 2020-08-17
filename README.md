# Book Shelf
このアプリは自分専用の本棚を作成し、本の内容を要約してすぐに見返すことができるアプリとなっています。視覚的に読んだ本がわかりやすく蓄積されていくので、達成感が味わえると共に要約力が付き、自身の能力の向上にも繋がります。

URL: http://52.199.133.126/<br>
開発環境：Ruby / Ruby on Rails / JavaScript/ JQuery / AWS / haml / scss<br>
<br>
テストアカウント<br>
ID: test@gmail.com<br>
PW: test123


# デモ
 
![bookshelf](https://user-images.githubusercontent.com/66983614/90341587-c1f56a80-e03b-11ea-88ab-492a582343e0.gif)

# 工夫したポイント
視覚的に何ができるかがすぐわかるように設計しました。他者の本の要約を見ることができ、レビューアプリとしても使用できます。

# 今後実装したい機能
今後実装したい機能としましては、ストレスフリーに新規投稿ができるようにすることと、簡単なコメント機能を作成して本に関する議論ができるようにしていきたいと思っています。
 
# 使用方法
 
```bash
git clone https://github.com/TakahiroTanaka-dev/Book_Shelf.git
```
# 作者
 
* 田中貴大
* テックキャンプ 79期卒業
* takahiro.forwork1130@gmail.com
* Twitter: https://twitter.com/engineer_tanaka
 
# ライセンス
[MIT license](https://en.wikipedia.org/wiki/MIT_License).

# DB設計
## users テーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null :false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :books, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_books, through: :likes, source: :book


## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|book_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :book

## books テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|author|string|null: false|
|text|string|null: false|
|image|string|

### Association
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user