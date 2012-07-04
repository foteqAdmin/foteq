# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# p# stands for participante
# pj# stands for projeto/pesquisa
# pb# stands for publicação
p1 = Participante.new(:nome => "Prof. Dr. Osvaldo Chiavone Filho", :email => "osvaldo@eq.ufrn.br", :projeto => "Comportamento de Sistemas com Hidrocarbonetos em Processos Químicos", :foto_url => "Prof Osvaldo.JPG", :descricao => "Possui graduação em Engenharia Química pelo Centro Universitário da FEI (1985), mestrado em Engenharia Química pela Universidade Federal do Rio de Janeiro no PEQ-Coppe (1988) e doutorado em Engenharia Química - Technical University of Denmark (1993). Atualmente é professor associado da Universidade Federal do Rio Grande do Norte. Tem ativa experiência em pesquisa em Termodinâmica Química Aplicada para o Projeto de Processos e em Tratamento de Efluentes e Resíduos com Técnicas Avançadas de Oxidação. Os seguintes temas têm sido estudados: equilíbrio de fases, fotoquímica, propriedades físico-químicas, desenvolvimento de dispositivos experimentais, como célula PVTx, flotação, floculação, absorção, destilação solar, e para o tratamento de resíduos com reação fotoquímica.", :lattes => "http://lattes.cnpq.br/2621516646153655", :login => "adminFOTEQ", :pass => "1", :pass_confirmation => "1", :permission => "admin")

p1.password = "d1eb8e7cdaa907fc7644db646c70fdeecca9802aaddc0723fe7b3bea19e2c7df"
p1.salt = "848913700.2051156756699407"

p1.save

pj1 = Pesquisa.new(:nome => 'Comportamento de Sistemas com Hidrocarbonetos em Processos Químicos', :descricao => "Este projeto consiste na representação de propriedades termodinâmicas do equilíbrio de fases para misturas reais nos níveis experimental e computacional, bem como na determinação e modelagem de dados de fotodegradação de hidrocarbonetos em água, usando a reação foto-Fenton. Os seguintes equilíbrios de fases são abordados com os respectivos métodos experimentais: líquido-vapor para sistemas hidrocarbonetos multicomponentes, utilizando os ebuliômetros de Fischer e Othmer; líquido-líquido para sistemas aquosos com polímeros, sais e enzimas de origem vegetal, usando uma célula analítica; e sólido-líquido, usando os métodos analítico e sintético, para os sistemas com hidrocarbonetos com vistas a previsão de formação de parafinas (composição e quantidade) com a temperatura. O comportamento volumétrico dessas misturas é também estudado por densimetria. Com respeito a parte teórico-computacional, os modelos termodinâmicos avançados de equação de estado cúbica e coeficiente de atividade, assim como métodos de cálculo e programas modernos são aplicados. As bases de dados eletrônicas DDB e DIPPR e simuladores, como HySys, juntamente com os dados obtidos experimentalmente e coletados na literatura estão sendo usados para as correlações sistemáticas e os testes de predição dos modelos em desenvolvimento. Com respeito ao tratamento matemático dos dados cinéticos de fotodegradação em estudo, o modelo de redes neurais tem sido aplicado com sucesso", :participantes => {"nome1" => p1.nome, "tipo1" => "Coordenador"}, :financiadores => {"nome1" => "Conselho Nacional de Desenvolvimento Científico e Tecnológico", "tipo1" => "bolsa"})

pj1.save

p2 = Participante.new(:nome => "Syllos Santos da Silva", :email => "syllos@eq.ufrn.br", :projeto => "Integração dos Processos de Flotação e Foto-Fenton para Redução do Total de Óleos e Graxas da Água Produzida", :descricao => " ", :login => "syllos", :pass => "foteq", :pass_confirmation => "foteq", :permission => "student")

p2.save

pj2 = Pesquisa.new(:nome => 'Integração dos Processos de Flotação e Foto-Fenton para Redução do Total de Óleos e Graxas da Água Produzida', :descricao => "Relacionar a concentração e o Balanço Hidrofílico-Lipofílico (BHL) de uma
série de tensoativos não iônicos com a cinética de redução do TOG da água
produzida por Flotação por Ar Induzido (FAI);
 
Avaliar a eficiência de mineralização do óleo presente na água produzida
através do processo foto-Fenton;
 
Analisar e modelar a integração dos FAI e foto-Fenton para redução o TOG
em águas produzidas.", :participantes => {"nome1" => p2.nome, "tipo1" => "Integrante"}, :financiadores => {"nome1" => "Conselho Nacional de Desenvolvimento Científico e Tecnológico", "tipo1" => "bolsa"})

pj2.save

pb1 = Publicacao.new(:participantes => {"nome1" => p2.nome, "nome2" => p1.nome, "nome3" => "Eduardo L. de Barros Neto", "nome4" => "Cláudio A. O. Nascimento"}, :titulo => "Integration of processes induced air floatation and photo-Fenton for treatment of residual water contaminated with xylene", :ano => 2012, :suporte => "Journal of Hazardous Materials", :volume => 199, :pag_ini => 151, :pag_final => 157,  :tipo => "periodicos", :abstract => "Bla balbalb alb al bla bla bla bla bla bla bla b al...")

pb1.save


