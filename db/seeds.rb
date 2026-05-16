User.create!(
  [
    {
      name: "Shiv Agent 1",
      email: "agent1@test.com",
      role: "agent",
      available: true,
      capacity: 5
    },
    {
      name: "Shiv Agent 2",
      email: "agent2@test.com",
      role: "agent",
      available: true,
      capacity: 3
    },
    {
      name: "Admin",
      email: "admin@test.com",
      role: "admin",
      available: true,
      capacity: 10
    }
  ]
)

puts "Seeded users"