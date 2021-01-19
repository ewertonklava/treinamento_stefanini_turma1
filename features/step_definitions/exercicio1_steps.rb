Dado('que estou na pagina inicial da Stefanini') do
  visit 'https://stefanini.com.br/'
end

Quando('clicar em Blog Carreiras') do
  find(:xpath, '//*[@id="navbarSupportedContent"]/ul/li[6]/a').hover
  find(:xpath, "//label[contains(.,'Blog Carreiras')]").click
end

Entao('verificar o artigo {string} é exibido') do |msg|
  	assert_text msg 
end