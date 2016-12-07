require 'pry'
cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

College.create(
  [
    {
      name: "早稲田大学"
    }
  ]
)

College.all.each do |college|
  college.depertments.create(
    [
      {
        name: "政経"
      },
      {
        name: "法学"
      },
      {
        name: "一文"
      },
      {
        name: "二文"
      },
      {
        name: "教育"
      },
      {
        name: "商学"
      },
      {
        name: "理工"
      },
      {
        name: "社学"
      },
      {
        name: "人科"
      },
      {
        name: "スポーツ"
      },
      {
        name: "国際教養"
      },
      {
        name: "文構"
      },
      {
        name: "文"
      },
    ]
  )
end
# 政治経済学部 政治学科
# 政治経済学部 経済学科
# 政治経済学部 国際政治経済学科
# 法学部 法学科
# 文化構想学部 文化構想学科
# 文学部 文学科
# 教育学部 教育学科　　　　　　　　　　
# 教育学部 国語国文学科
# 教育学部 英語英文学科
# 教育学部 社会科
# 教育学部 数学科
# 教育学部 理学科
# 教育学部 複合文化学科
# 商学部 商学科
# 基幹理工学部 数学科
# 基幹理工学部 応用数理学科
# 基幹理工学部 情報理工学科
# 基幹理工学部 機械科学・航空学科
# 基幹理工学部 電子物理システム学科
# 基幹理工学部 表現工学科
# 基幹理工学部 情報通信学科
# 創造理工学部 建築学科
# 創造理工学部 総合機械工学科
# 創造理工学部 経営システム工学科
# 創造理工学部 社会環境工学科
# 創造理工学部 環境資源工学科
# 先進理工学部 物理学科
# 先進理工学部 応用物理学科
# 先進理工学部 化学・生命化学科
# 先進理工学部 応用化学科
# 先進理工学部 生命医科学科
# 先進理工学部 電気・情報生命工学科
# 社会科学部 社会科学科
# 人間科学部 人間環境科学科
# 人間科学部 健康福祉科学科
# 人間科学部 人間情報科学科
# スポーツ科学部 スポーツ科学科
# 国際教養学部 国際教養学科

College.all.each do |college|
  college.depertments.each  do |department|
    department.undergraduates.create(
      [
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
        {
          college_id: college.id,
          name: "経済"
        },
      ]
    )
  end
end

User.create(
  [
    {
      name: "aaa",
      email: "xxx@gmail.com",
      password_digest: BCrypt::Password.create("1111111", cost: cost),
      agreement: true,
    },
    {
      name: "bbb",
      email: "yyy@gmail.com",
      password_digest: BCrypt::Password.create("1111111", cost: cost),
      agreement: true,
    },
  ]
)

User.all.each do |exhibitor|
  exhibitor.items.create(
    [
      {
        name: "線形代数Ⅰ",
        row_price: "1000",
        price_with_margin: 1000*1.1,
        transaction_status: 1,
        preservation_status: 2,
        is_sold: false,
        auther: "山田 太郎",
        image: File.open("./public/img/test_data/exhibits/exhibit_image_1.jpg"),
        description: "刑法総論　第二版
                      西田典之
                      定価3,300円

                      大学の教科書として購入しましたがあまり使用しませんでした。
                      外側は持ち運びの際にできたと思われる擦れ傷がありますが、中はきれいです。

                      ほぼ未使用ですが
                      数年自宅で保管した中古品であることを十分ご理解の上ご購入をお願いします。

                      ご不明な点や値引き交渉はコメント欄へ☆
                       いいね! 0   不適切な商品の報告",
        college_id: College.first.id,
        depertment_id: Depertment.first.id,
        undergraduate_id: Undergraduate.first.id,
      },
      {
        name: "データ構造とアルゴリズム",
        row_price: "3000",
        price_with_margin: 3000*1.1,
        transaction_status: 0,
        preservation_status: 2,
        is_sold: false,
        auther: "山田 太郎",
        image: File.open("./public/img/test_data/exhibits/exhibit_image_1.jpg"),
        description: "刑法総論　第二版
                      西田典之
                      定価3,300円

                      大学の教科書として購入しましたがあまり使用しませんでした。
                      外側は持ち運びの際にできたと思われる擦れ傷がありますが、中はきれいです。

                      ほぼ未使用ですが
                      数年自宅で保管した中古品であることを十分ご理解の上ご購入をお願いします。

                      ご不明な点や値引き交渉はコメント欄へ☆
                       いいね! 0   不適切な商品の報告",
        college_id: College.first.id,
        depertment_id: Depertment.first.id,
        undergraduate_id: Undergraduate.first.id,
      }
    ]
  )
end
