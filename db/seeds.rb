# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cadastrando as CATEGORIAS...'
categories = ['Animais e acessórios',
              'Esportes',
              'Para a sua casa',
              'Eletrônicos e celulares',
              'Música e hobbies',
              'Bebês e crianças',
              'Moda e beleza',
              'Veículos e barcos',
              'Imóveis',
              'Empregos e negócios']

categories.each do |category|
  Category.find_or_create_by(description: category)
end

puts 'CATEGORIAS cadastradas com sucesso!'

##### ADMINISTRADORES #####

puts 'Cadastrando o administrador padrão...'

Admin.create!(first_name: 'admin', last_name: 'Da silva', email: 'admin@admin.com.br',
              password: '123456', password_confirmation: '123456', role: 0)

puts 'Administrador cadastrado com sucesso!'

#####  MEMBROS #####

puts 'Cadastrando o membro padrão...'

Member.create!(first_name: 'Membro padrão', last_name: 'Da silva', email: 'membro@membro.com.br',
               password: '123456', password_confirmation: '123456')

puts 'Membro cadastrado com sucesso!'
