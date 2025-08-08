# db/seeds.rb

Event.destroy_all

Event.create!([
  {
    title: "Tech Innovators Conference 2025",
    description: "A gathering of leading minds in technology, innovation, and AI advancements.",
    location: "Bangalore International Exhibition Centre",
    start_time: Time.now + 7.days,
    end_time: Time.now + 7.days + 8.hours,
    capacity: 300,
    price: 499.00
  },
  {
    title: "Mountain Adventure Trek",
    description: "An exhilarating trek through the scenic Himalayas, perfect for adventure lovers.",
    location: "Manali, Himachal Pradesh",
    start_time: Time.now + 14.days,
    end_time: Time.now + 17.days,
    capacity: 50,
    price: 1200.00
  },
  {
    title: "Digital Marketing Masterclass",
    description: "Hands-on workshop on SEO, PPC, and Social Media Ads with industry experts.",
    location: "Mumbai Convention Hall",
    start_time: Time.now + 10.days,
    end_time: Time.now + 10.days + 6.hours,
    capacity: 100,
    price: 799.00
  },
  {
    title: "Gourmet Food Festival",
    description: "Taste the finest cuisines from top chefs around the country.",
    location: "India Habitat Centre, New Delhi",
    start_time: Time.now + 3.days,
    end_time: Time.now + 3.days + 10.hours,
    capacity: 200,
    price: 350.00
  },
  {
    title: "Startup Pitch Night",
    description: "Networking and pitching event for aspiring entrepreneurs and investors.",
    location: "WeWork Koramangala, Bangalore",
    start_time: Time.now + 5.days,
    end_time: Time.now + 5.days + 4.hours,
    capacity: 80,
    price: 0.00
  }
])

puts "✅ Seeded #{Event.count} events!"
