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

def colors_name
  colors = ["#ff5e00", "#7a00cc", "#7d0746", "#b3cf00", "#04b81c", "#171061",
            "#b05500", "#ff0000","#7c8f00","#065e00", "#0009ff", "#616161"]
end

def status_name_color
  status_color = [["Não iniciada", "#7c8f00"],
                  ["Em andamento", "#065e00"],
                  ["Validado", "#0009ff"],
                  ["Aguardando validação", "#616161"],
                  ["Cancelado","#b05500"]]
end

def labels_name
  labels = [["Bug","#ff0000"],["Documentação","#0009ff"],
            ["Funcionalidade","#171061"],["Melhoria","#04b81c"],
            ["Operacional","#b3cf00"],["Pesquisa","#7a00cc"],
            ["Teste","#ff5e00"]]
end