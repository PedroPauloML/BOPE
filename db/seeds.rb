# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Gerando USUÁRIO PADRÃO..."

user = User.create!(
        email: 'admin@admin.com',
        password: 123456,
        password_confirmation: 123456
      )
UserProfile.create!(
  name: 'Usuário Padrão',
  student_number: Faker::Number.number(10),
  role: 0,
  user_id: user.id
)

puts "Gerando USUÁRIO PADRÃO... [OK]"

puts "Gerando as CORES..."

colors = colors_name
colors.each do |color|
  Color.create!(
    description: color
  )
end

puts "Gerando as CORES... [OK]"

puts "Gerando os RÓTULOS..."

labels = labels_name

labels.each do |name, color|
  Label.create!(
    description: name,
    color_id: Color.where(description: color).first.id
  )
end

puts "Gerando os RÓTULOS... [OK]"

puts "Gerando os STATUS..."

status_color = status_name_color

status_color.each do |status, color|
  Status.create!(
    description: status,
    color_id: Color.where(description: color).first.id
  )
end

puts "Gerando os STATUS... [OK]"
