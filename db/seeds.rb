Assignment.destroy_all
Lead.destroy_all
User.destroy_all

User.create!([
  {
    name: "Amit Sharma",
    email: "amit@test.com",
    role: "agent",
    available: true,
    capacity: 5,
    active_leads_count: 1,
    skill_level: :senior,
    languages: ["Hindi", "English"],
    regions: ["Mumbai", "Delhi"]
  },

  {
    name: "Priya Nair",
    email: "priya@test.com",
    role: "agent",
    available: true,
    capacity: 4,
    active_leads_count: 0,
    skill_level: :mid,
    languages: ["English", "Tamil"],
    regions: ["Chennai", "Bangalore"]
  },

  {
    name: "Rohit Verma",
    email: "rohit@test.com",
    role: "agent",
    available: true,
    capacity: 3,
    active_leads_count: 2,
    skill_level: :junior,
    languages: ["Hindi", "Punjabi"],
    regions: ["Delhi", "Jaipur"]
  },

  {
    name: "Sneha Patel",
    email: "sneha@test.com",
    role: "agent",
    available: true,
    capacity: 5,
    active_leads_count: 1,
    skill_level: :senior,
    languages: ["Gujarati", "Hindi", "English"],
    regions: ["Ahmedabad", "Mumbai"]
  },

  {
    name: "Admin User",
    email: "admin@test.com",
    role: "admin",
    available: true,
    capacity: 999,
    skill_level: :senior,
    languages: ["English"],
    regions: ["Mumbai"]
  }
])

puts "Smart routing seed data created"