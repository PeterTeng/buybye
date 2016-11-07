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
      {
        name: ""
      },
      {
        name: ""
      },
      {
        name: ""
      },
      {
        name: ""
      },
      {
        name: ""
      },
    ]
  )
end

College.all.each do |college|
  college.depertments.each  do |department|
    department.undergraduates.create(
      [
        {
          college_id: college.id,
          name: "経済"
        }
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
        price: "1000",
        transaction_status: 1,
        preservation_status: 2,
        is_sold: false,
        auther: "山田 太郎",
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
        price: "3000",
        transaction_status: 0,
        preservation_status: 2,
        is_sold: false,
        auther: "山田 太郎",
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

Item.all.each do |item|
  item.item_images.create(
    [
      {
        image: File.open("./public/img/test_data/exhibits/exhibit_image_1.jpg")
      },
      {
        image: File.open("./public/img/test_data/exhibits/exhibit_image_1.jpg")
      },
    ]
  )
end
