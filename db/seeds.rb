# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PgLang.create!(
  [
    {
      name:"HTML"
    },
    {
      name:"CSS"
    },
    {
      name:"JavaScript"
    },
    { name: "jQuery" },
    { name:"Ruby" },
    { name: "Ruby on Rails" },
    { name: "PHP" },
    { name: "Java" },
    { name: "Python" },
    { name: "Command Line" },
    { name: "Git" },
    { name: "SQL" },
    { name: "Sass" },
    { name: "Go" },
    { name: "React" },
    { name: "Node.js" },
    { name: "NoCode" },
    { name: "AWS" }
  ]
  )


Tag.create!(
  [
    { name: "年間休日１２０日以上"},
    { name: "完全週休2日制"},
    { name: "土日祝休み"},
    { name: "5日以上の連続休暇制度あり"},
    { name: "17時までに退社可"},
    { name: "業務時間7時間以内"},
    { name: "定時退社"},
    { name: "月平均残業時間20時間以内"},
    { name: "フレックス勤務OK"},
    { name: "ストックオプションあり"},
    { name: "固定給２５万円以上"},
    { name: "退職金あり"},
    { name: "交通費全額支給"},
    { name: "転勤なし"},
    { name: "在宅勤務OK"},
    { name: "社宅・家賃補助制度あり"},
    { name: "育児支援・託児所あり"},
    { name: "社員食堂・食事補助あり"},
    { name: "研修制度充実"},
    { name: "育児・介護休業取得実績あり"},
    { name: "服装自由"},
    { name: "副業OK"},
    { name: "設立３０年以上"},
    { name: "上場企業・株式公開企業"},
    { name: "2年連続売上10％以上UP"},
    { name: "面接１回"},
    { name: "離職率5％以下"},
    { name: "平均年齢２０代"},
    { name: "中途入社５０％以上"},
    { name: "女性が活躍中"},
    { name: "女性管理職登用あり"},
    { name: "語学を活かす"}
  ]
)