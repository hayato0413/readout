# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  "ユーザー1", 
  "ユーザー2",
  "ユーザー3", 
  "ユーザー4", 
  "ユーザー5",
  "ユーザー6",
  "ユーザー7",
  "ユーザー8",
  "ユーザー9",
  "ユーザー10"
]

users.each_with_index do |user, i|
  User.create(
    id: i + 1,
    name: "#{user}",
    email: "#{i + 1}@gamil.com",
    password: SecureRandom.urlsafe_base64
  )
end

Post.create(
  id:             1,
  title:          '19600日やれば、ムキムキになる! 必読! 筋トレマニアのための必殺本', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'ゆでたまご',
  publish:        '秋永社じゃない文庫',
  evaluation:     5,
  user_id:        1
)
Post.create(
  id:             2,
  title:          'ヤンピース', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '小野田 栄一',
  publish:        '秋永社',
  evaluation:     3,
  user_id:        3
)
Post.create(
  id:             3,
  title:          '傾きかたが1000分の900割', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'お話上手先生',
  publish:        '山川書店',
  evaluation:     1,
  user_id:        5
)
Post.create(
  id:             4,
  title:          'オイラの更年期はあっているのだろう', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '冬の下 ふゆの',
  publish:        'ゲゲゲ文庫',
  evaluation:     5,
  user_id:        7
)
Post.create(
  id:             5,
  title:          'ソルトマンのマーケティング300の法則', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'ジョン・ソルトマン',
  publish:        '森文庫',
  evaluation:     4,
  user_id:        9
)
Post.create(
  id:             6,
  title:          '多く動く力', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'ほかえもん',
  publish:        '幻の冬本社',
  evaluation:     2,
  user_id:        1
)
Post.create(
  id:             7,
  title:          '料理本', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '池田',
  publish:        'うまいもん文庫',
  evaluation:     2,
  user_id:        3
)
Post.create(
  id:             8,
  title:          '説小', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '絹山',
  publish:        '本出す文庫',
  evaluation:     1,
  user_id:        10
)
Post.create(
  id:             9,
  title:          '小説', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '絹山',
  publish:        '本出す文庫',
  evaluation:     5,
  user_id:        4
)
Post.create(
  id:             10,
  title:          'ダー君の変化論', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'アルベルト・ウォーロン',
  publish:        'yokuwakara company',
  evaluation:     3,
  user_id:        2
)
Post.create(
  id:             11,
  title:          '俺が生きてきた200年', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'めちゃ生きちゃったさん',
  publish:        '長生き文庫',
  evaluation:     3,
  user_id:        8
)
Post.create(
  id:             12,
  title:          '古代アート辞典', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '岡山二郎',
  publish:        '美文庫',
  evaluation:     4,
  user_id:        6
)
Post.create(
  id:             13,
  title:          'この頃の日常', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '絹山',
  publish:        '本出す文庫',
  evaluation:     1,
  user_id:        5
)
Post.create(
  id:             14,
  title:          '源氏物語', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  evaluation:     1,
  user_id:        8
)
Post.create(
  id:             15,
  title:          '不思議の国のアリス', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'ルイス・キャロル',
  evaluation:     5,
  user_id:        10
)
Post.create(
  id:             16,
  title:          '絵本', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'honnsidai',
  publish:        '本文庫',
  evaluation:     5,
  user_id:        7
)
Post.create(
  id:             17,
  title:          '小説2', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '山々絹絹',
  publish:        '本出す文庫',
  evaluation:     5,
  user_id:        2
)
Post.create(
  id:             18,
  title:          'ruby on rails による超大規模開発のススメ', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'プロプログラマ',
  publish:        '幻灯舎',
  evaluation:     3,
  user_id:        3
)
Post.create(
  id:             19,
  title:          'Twitterで発信すれば稼げちゃいます本', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         'やる気万太郎',
  publish:        'twitter',
  evaluation:     4,
  user_id:        2
)
Post.create(
  id:             20,
  title:          '真', 
  content:        'サンプル',
  author:         '神',
  publish:        '天空',
  evaluation:     4,
  user_id:        1
)
Post.create(
  id:             21,
  title:          '時は金なり', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '格言',
  publish:        'マジでそう文庫',
  evaluation:     5,
  user_id:        6
)
Post.create(
  id:             22,
  title:          '小説3', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '絹山',
  publish:        '本出す文庫',
  evaluation:     3,
  user_id:        5
)
Post.create(
  id:             23,
  title:          'javascriptで作るゲーミングPC', 
  content:        'サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル',
  author:         '神',
  publish:        '不思議舎',
  evaluation:     4,
  user_id:        9
)

Category.create(
  id:             1,
  name:           '小説'
)
Category.create(
  id:             2,
  name:           'ビジネス'
)
Category.create(
  id:             3,
  name:           'スポーツ'
)
Category.create(
  id:             4,
  name:           '漫画'
)
Category.create(
  id:             5,
  name:           'コンピュータ'
)
Category.create(
  id:             6,
  name:           'ノンフィクション'
)
Category.create(
  id:             7,
  name:           'ミステリー'
)
Category.create(
  id:             8,
  name:           'ライトノベル'
)
Category.create(
  id:             9,
  name:           '科学'
)
Category.create(
  id:             10,
  name:           '教育'
)
Category.create(
  id:             11,
  name:           '子育て'
)
Category.create(
  id:             12,
  name:           '政治'
)
Category.create(
  id:             13,
  name:           '自叙伝'
)
Category.create(
  id:             14,
  name:           '料理'
)
Category.create(
  id:             15,
  name:           '歴史'
)
Category.create(
  id:             16,
  name:           'アート'
)

PostCategoryRelation.create(
  id: 1,
  post_id: 1,
  category_id: 1
)
PostCategoryRelation.create(
  id: 2,
  post_id: 1,
  category_id: 3
)
PostCategoryRelation.create(
  id: 3,
  post_id: 1,
  category_id: 5
)
PostCategoryRelation.create(
  id: 4,
  post_id: 1,
  category_id: 14
)
PostCategoryRelation.create(
  id: 5,
  post_id: 2,
  category_id: 12
)
PostCategoryRelation.create(
  id: 6,
  post_id: 2,
  category_id: 15
)
PostCategoryRelation.create(
  id: 7,
  post_id: 3,
  category_id: 16
)
PostCategoryRelation.create(
  id: 8,
  post_id: 4,
  category_id: 4
)
PostCategoryRelation.create(
  id: 9,
  post_id: 4,
  category_id: 6
)
PostCategoryRelation.create(
  id: 10,
  post_id: 4,
  category_id: 7
)
PostCategoryRelation.create(
  id: 11,
  post_id: 4,
  category_id: 13
)
PostCategoryRelation.create(
  id: 12,
  post_id: 4,
  category_id: 16
)
PostCategoryRelation.create(
  id: 13,
  post_id: 5,
  category_id: 3
)
PostCategoryRelation.create(
  id: 14,
  post_id: 5,
  category_id: 6
)
PostCategoryRelation.create(
  id: 15,
  post_id: 6,
  category_id: 5
)
PostCategoryRelation.create(
  id: 16,
  post_id: 6,
  category_id: 7
)
PostCategoryRelation.create(
  id: 17,
  post_id: 6,
  category_id: 9
)
PostCategoryRelation.create(
  id: 18,
  post_id: 7,
  category_id: 1
)
PostCategoryRelation.create(
  id: 19,
  post_id: 8,
  category_id: 2
)
PostCategoryRelation.create(
  id: 20,
  post_id: 8,
  category_id: 3
)
PostCategoryRelation.create(
  id: 21,
  post_id: 9,
  category_id: 8
)
PostCategoryRelation.create(
  id: 22,
  post_id: 9,
  category_id: 10
)
PostCategoryRelation.create(
  id: 23,
  post_id: 10,
  category_id: 4
)
PostCategoryRelation.create(
  id: 24,
  post_id: 10,
  category_id: 9
)
PostCategoryRelation.create(
  id: 25,
  post_id: 10,
  category_id: 13
)
PostCategoryRelation.create(
  id: 26,
  post_id: 10,
  category_id: 14
)
PostCategoryRelation.create(
  id: 27,
  post_id: 11,
  category_id: 3
)
PostCategoryRelation.create(
  id: 28,
  post_id: 11,
  category_id: 4
)
PostCategoryRelation.create(
  id: 29,
  post_id: 12,
  category_id: 2
)
PostCategoryRelation.create(
  id: 30,
  post_id: 13,
  category_id: 1
)
PostCategoryRelation.create(
  id: 31,
  post_id: 13,
  category_id: 3
)
PostCategoryRelation.create(
  id: 32,
  post_id: 14,
  category_id: 12
)
PostCategoryRelation.create(
  id: 33,
  post_id: 15,
  category_id: 11
)
PostCategoryRelation.create(
  id: 34,
  post_id: 16,
  category_id: 1
)
PostCategoryRelation.create(
  id: 35,
  post_id: 16,
  category_id: 3
)
PostCategoryRelation.create(
  id: 36,
  post_id: 17,
  category_id: 4
)
PostCategoryRelation.create(
  id: 37,
  post_id: 17,
  category_id: 7
)
PostCategoryRelation.create(
  id: 38,
  post_id: 17,
  category_id: 15
)
PostCategoryRelation.create(
  id: 39,
  post_id: 18,
  category_id: 14
)
PostCategoryRelation.create(
  id: 40,
  post_id: 18,
  category_id: 16
)
PostCategoryRelation.create(
  id: 41,
  post_id: 19,
  category_id: 1
)
PostCategoryRelation.create(
  id: 42,
  post_id: 19,
  category_id: 2
)
PostCategoryRelation.create(
  id: 43,
  post_id: 19,
  category_id: 3
)
PostCategoryRelation.create(
  id: 44,
  post_id: 20,
  category_id:5
)
PostCategoryRelation.create(
  id: 45,
  post_id: 20,
  category_id: 6
)
PostCategoryRelation.create(
  id: 46,
  post_id: 21,
  category_id: 8
)
PostCategoryRelation.create(
  id: 47,
  post_id: 21,
  category_id: 11
)
PostCategoryRelation.create(
  id: 48,
  post_id: 21,
  category_id: 13
)
PostCategoryRelation.create(
  id: 49,
  post_id: 21,
  category_id: 14
)
PostCategoryRelation.create(
  id: 50,
  post_id: 21,
  category_id: 16
)
PostCategoryRelation.create(
  id: 51,
  post_id: 22,
  category_id: 3
)
PostCategoryRelation.create(
  id: 52,
  post_id: 22,
  category_id: 5
)
PostCategoryRelation.create(
  id: 53,
  post_id: 23,
  category_id: 6
)
PostCategoryRelation.create(
  id: 54,
  post_id: 23,
  category_id: 9
)
PostCategoryRelation.create(
  id: 55,
  post_id: 23,
  category_id: 10
)
