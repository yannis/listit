raise Exception, 'Can only seed in development!' unless Rails.env.development?

Item.destroy_all
List.destroy_all
User.destroy_all

Item.connection.execute('ALTER SEQUENCE items_id_seq RESTART WITH 1')
List.connection.execute('ALTER SEQUENCE lists_id_seq RESTART WITH 1')
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')

puts 'Creating users'
3.times do |i|
  user = User.new email: "user#{i + 1}@example.com"
  user.skip_confirmation!
  user.save!
end

puts 'Creating lists'
User.find_each do |user|
  3.times do |i|
    user.lists.create!(name: "user_#{user.id} list #{i + 1}")
  end
end

puts 'Creating items'
List.find_each do |list|
  3.times do |i|
    list.items.create!(name: "#{list.name} item #{i + 1}")
    list.items.create!(name: "#{list.name} item crossed #{i + 1}", crossed_at: Time.current)
  end
end
