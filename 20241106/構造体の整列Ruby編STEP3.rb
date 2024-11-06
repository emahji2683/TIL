# https://paiza.jp/works/mondai/class_primer/class_primer__sort/edit?language_uid=ruby

class User
  attr_accessor :nickname, :old, :birth, :state
  def initialize(nickname, old, birth, state)
    @nickname = nickname
    @old = old
    @birth = birth
    @state = state
  end
end

n = gets.chomp.to_i
users = []

n.times do
  nickname, old, birth, state = gets.chomp.split
  users << User.new(nickname, old, birth, state)
end

sorted_users = users.sort_by { |user| user.old }

sorted_users.each do |user|
  puts "#{user.nickname} #{user.old} #{user.birth} #{user.state}"
end

