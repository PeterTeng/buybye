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
          name: "経済"
        }
      ]
    )
  end
end

User.create(
  [
    {
      email: "xxx@gmail.com",
      password_digest: BCrypt::Password.create("1111111", cost: cost),
    },
    {
      email: "yyy@gmail.com",
      password_digest: BCrypt::Password.create("1111111", cost: cost),
    },
  ]
)

User.all.each do |user|
  user.items.create(
    [
      {
        name: "線形代数Ⅰ",
        price: "1000",
        transaction_status: 1,
        preservation_status: 2,
        is_sold: false,
        auther: "山田 太郎"
      },
      {
        name: "データ構造とアルゴリズム",
        price: "3000",
        transaction_status: 0,
        preservation_status: 2,
        is_sold: false,
        auther: "山田 太郎"
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
