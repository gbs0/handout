case Rails.env
when 'development'
  Chapter.destroy_all
  puts "♻️ Destroyed all Tillages"
  Book.destroy_all
  puts "♻️ Destroyed all Composts"
  User.destroy_all
  puts "♻️ Destroyed all Users"

  puts 'Creating Composts...'
  file["adubos"].each do |compost|
    Compost.create! compost.slice("comercial_name", "nitrogen", "potassium", "calcium", "price_reference")
  end
  puts '✅ Done Created Composts!'

  puts 'Creating users...'
  admin = User.new(id: 1,
                name: "Admin",
                email: "test@test.com",
                password: "password",
                admin: true
                )
  admin.save!
  User.create(id: 2,
        name: "Gabriel Schiavo",
        email: "gabriel.schiavo0@gmail.com",
        password: "password"
      )
  puts "✅ Done Creating Users!"

  puts "Creating Books..."
  5.times do 
    # Book.create(title)
  end
  puts "✅ Done Creating Books"

  puts "Creating Chapters..."
  25.times do 
    # Chapter.create()
  end
  end

when 'test'
# test-specific seeds ...
# (Consider having your tests set up the data they need
# themselves instead of seeding it here!)

when 'production'
  puts 'Creating user...'
  admin = User.new(id: 1,
                name: "Gabriel Administrador",
                email: "gabrielschiavo0@gmail.com",
                password: "p4ssw0rd$"
                admin: true
                )
  admin.save!
  puts "✅ Done Creating User!"
end