namespace :utils do
  desc "Cadastra novos administradores aleatoriamente"
  task generate_admins: :environment do
    p 'Cadastrando novos administradores'
    10.times do
      Admin.create!(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: '123456',
                    password_confirmation: '123456')
    end
    p 'Pronto!'
  end
end
