
Thing.find_or_create_by(name:"jones", description: "I like to eat cake")
Thing.find_or_create_by(name:"Justin", description: "I am from Canada ah!")
Thing.find_or_create_by(name:"bob", description: "I love guns and I hate people")
Thing.find_or_create_by(name:"matt", description: "I eat poop..")

if Thing.all.count < 200
  200.times do
    Thing.create(name:Faker::Name.name, description:Faker::Lorem.sentence(2))
  end 
end
