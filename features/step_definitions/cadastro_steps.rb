Dado('que acesso o site ecomerce') do
  visit "http://automationpractice.com/index.php"
end

Quando('efetuar o cadastro') do
	email = Faker::Internet.email 
	nome = Faker::Name.name
	sobrenome = Faker::Name.name
  	find('.login').click
  	find('#email_create').send_keys(email)
  	find('#SubmitCreate').click
  	fill_in('customer_firstname', :with => nome)
    fill_in('customer_lastname', :with => sobrenome)
  	

  	#binding.pry
end

Entao('o cadastro tera sido realizado') do
  pending # Write code here that turns the phrase above into concrete actions
end