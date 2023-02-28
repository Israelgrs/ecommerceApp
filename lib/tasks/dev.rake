namespace :dev do

  desc 'Setup Development'
  task setup: :environment do
    p 'Executando o setup para desenvolvimento...'
    puts `rails db:drop`
    puts `rails db:create`
    puts `rails db:migrate`
    puts `rails db:seed`
    puts `rails dev:generate_admins`
    puts `rails dev:generate_members`
    puts `rails dev:generate_ads`
    puts `rails dev:generate_comments`

    p 'Setup executado com sucesso!'
  end

  desc 'Cadastra novos administradores aleatoriamente'
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

  desc 'Cria membos fake'
  task generate_members: :environment do
    p 'Cadastrando Membros...'
    50.times do
      Member.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456'
      )
    end

    p 'Membros Cadastrados com sucesso!'
  end

  desc 'Cria comentários fake'
  task generate_comments: :environment do
    p 'Criando comentários...'
    
    Ad.all.each do |ad|
      (Random.rand(3)).times do
        Comment.create!(
          body: Faker::Lorem.sentence([1,2,3,4,5].sample),
          member: Member.all.sample,
          ad: ad
        )
      end
    end

    p 'Comentários Cadastrados com sucesso!'
  end

  desc 'Cria Anúncios Fake'
  task generate_ads: :environment do
    p 'Cadastrando Anúncios'
    100.times do
      ad = Ad.new(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description_md: Faker::Markdown.emphasis,
        description_short: Faker::Lorem.sentence(3),
        member: Member.all.sample,
        category: Category.all.sample,
        finish_date: Date.today + Random.rand(90),
        price: "#{Random.rand(1000)},#{Random.rand(99)}"
      )
      ad.picture.attach(io: File.open(Rails.root.join('public', 'templates', 'images-for-ads', "#{rand(8)}.jpg")), filename: 'picture.jpg')
      ad.save
    end

    p 'ANÚNCIOS CADASTRADOS'
  end
end
