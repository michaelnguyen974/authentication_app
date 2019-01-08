require './lib/user.rb'
RSpec.describe do 
  # let(:user1) { User.create( :email => 'test@gmail.com', :password => 'secret123')}
  # let(:user2) { User.create( :email => 'test@gmail.com', :password => 'secret123')}

  it 'Checks if user does not exist' do 
    expect(User.authenticate('fakemail@gmail.com', 'secret123')).to eq nil
  end 

  it 'If user does exist, but password incorrect' do 
    user1 = User.create(:email => 'test@gmail.com', :password => 'secret123')
    expect(User.authenticate('test@gmail.com', 'secret12')).to eq nil 
  end 

  it 'If user does and password correct' do 
    user1 = User.create(:email => 'test@gmail.com', :password => 'correct_password')
    expect(User.authenticate('test@gmail.com', 'correct_password')).to eq user1
  end

  it 'validates uniqueness of email property' do 
    user1 = User.create(:email => 'test@gmail.com', :password => 'correct_password')
    user2 = User.create(:email => 'test@gmail.com', :password => 'correct_password')
    expect(user1.valid?).to eq true
    expect(user2.valid?).to eq false
  end 
end 

