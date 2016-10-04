cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
College.create(
  [
    {
      name: "早稲田大学"
    }
  ]
)

College.first.users.create(
  [
    {
      email: "xxx@gmail.com",
      password_digest: BCrypt::Password.create("1111111", cost: cost),
    }
  ]
)

User.all.each do |user|
  user.exhibits.create(
    [
      {
        name: "線形代数Ⅰ",
        price: "1000",
        transaction_status: 1,
        preservation_status: 2,
        is_sold: false,
        auther: "山田 太郎"
      }
    ]
  )
end

Exhibit.all.each do |exhibit|
  exhibit.exhibit_images.create(
    [
      {
        image: File.open("./public/")
      }
    ]
  )
end
