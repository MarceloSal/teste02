namespace :dev do
  DEFAULT_PASSWORD = 123456
  
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
        show_spinner("Apagando BD...") { %x(rails db:drop) }
        show_spinner("Criando BD...") { %x(rails db:create) }
        show_spinner("Migrando BD...") { %x(rails db:migrate) }
        show_spinner("Criando o Administrador padrão...") { %x(rails dev:add_default_admin) }
        show_spinner("Criando Administradores extras...") { %x(rails dev:add_extra_admins) }
        show_spinner("Criando Membro...") { %x(rails dev:add_default_member) }
        show_spinner("Criando o Usuário padrão...") { %x(rails dev:add_default_user) }
        
    else
        puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      first_name: 'Admin',
      last_name: 'Admin',
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona adminstradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona membro"
  task add_default_member: :environment do
    Member.create!(
      first_name: 'Marcelo',
      last_name: 'Salmeron',
      email: 'salmeron.marcelo@gmail.com',
      cell_phone: '11996231987',
      birthdate: '11/04/1975',
      address: 'Rodovia João Leme dos Santos, 521'
    )
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
      yield
    spinner.success("(#{msg_end})")
  end
end
