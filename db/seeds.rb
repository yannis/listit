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
3.times do |i|
  User.find_each do |user|
    user.lists.create!(name: "user_#{user.id}_list_#{i + 1}")
  end
end

puts 'Creating items'
3.times do |i|
  List.find_each do |list|
    list.items.create!(name: "#{list.name}_item_#{i + 1}")
  end
end
