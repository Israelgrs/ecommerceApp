namespace :utils do
  desc "Cadastra novos administradores aleatoriamente"
  task generate_admins: :environment do
    p 'Cadastrando novos administradores'
    10.times do
      Admin.create!(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: '123456',
                    password_confirmation: '123456',
                    role: [0, 0, 1, 1, 1, 1].sample)
    end
    p 'Pronto!'
  end

  desc 'Cria Anúncios Fake'
  task generate_ads: :environment do
    p 'Cadastrando Anúncios'

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: Faker::Lorem.sentence(3),
        member: Member.all.sample,
        category: Category.all.sample
      )
    end

    p 'ANÚNCIOS CADASTRADOS'
  end
end
