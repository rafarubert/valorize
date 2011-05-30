class Orcamento

  include ActiveModel::Validations
  extend ActiveModel::Naming 
  include ActiveModel::Conversion

  attr_accessor :nome , :nascimento , :fone_residencial , :fone_celular , :fone_comercial , :cpf , :rg , :endereco , :cep , :apolice_renovacao , :apolice_seguradora , :apolice_numero , :apolice_ci , :veiculo_modelo , :veiculo_ano , :veiculo_combustivel , :veiculo_zero , :veiculo_data_nota , :veiculo_proprietario , :veiculo_parentesco, :veiculo_placa , :veiculo_chassi, :veiculo_renavam, :veiculo_alarme , :veiculo_ar,:veiculo_vidro,:veiculo_air, :veiculo_abs, :veiculo_trava, :veiculo_aro,:veiculo_gas,:veiculo_direcao, :condutor_nome, :condutor_nascimento,:condutor_sexo, :condutor_estadocivil, :condutor_cpf, :condutor_relacao 
   
   def initialize(nome=nil, nascimento=nil, fone_residencial=nil, fone_celular=nil, fone_comercial=nil, cpf=nil, rg=nil, endereco=nil, cep=nil, apolice_renovacao=nil, apolice_seguradora=nil, apolice_numero=nil, apolice_ci=nil, veiculo_modelo=nil, veiculo_ano=nil, veiculo_combustivel=nil, veiculo_zero=nil, veiculo_data_nota=nil, veiculo_proprietario=nil, veiculo_parentesco=nil, veiculo_placa=nil, veiculo_chassi=nil, veiculo_renavam=nil, veiculo_alarme=nil, veiculo_ar=nil,veiculo_vidro=nil,veiculo_air=nil, veiculo_abs=nil, veiculo_trava=nil, veiculo_aro=nil,veiculo_gas=nil,veiculo_direcao=nil, condutor_nome=nil, condutor_nascimento=nil,condutor_sexo=nil, condutor_estadocivil=nil, condutor_cpf=nil, condutor_relacao=nil)
     @nome, @nascimento, @fone_residencial, @fone_celular, @fone_comercial, @cpf, @rg, @endereco, @cep, @apolice_renovacao, @apolice_seguradora, @apolice_numero, @apolice_ci, @veiculo_modelo, @veiculo_ano, @veiculo_combustivel, @veiculo_zero, @veiculo_data_nota, @veiculo_proprietario, @veiculo_parentesco, @veiculo_placa, @veiculo_chassi, @veiculo_renavam, @veiculo_alarme, @veiculo_ar,@veiculo_vidro,@veiculo_air, @veiculo_abs, @veiculo_trava, @veiculo_aro,@veiculo_gas,@veiculo_direcao, @condutor_nome, @condutor_nascimento,@condutor_sexo, @condutor_estadocivil, @condutor_cpf, @condutor_relacao = nome, nascimento, fone_residencial, fone_celular, fone_comercial, cpf, rg, endereco, cep, apolice_renovacao, apolice_seguradora, apolice_numero, apolice_ci, veiculo_modelo, veiculo_ano, veiculo_combustivel, veiculo_zero, veiculo_data_nota, veiculo_proprietario, veiculo_parentesco, veiculo_placa, veiculo_chassi, veiculo_renavam, veiculo_alarme, veiculo_ar,veiculo_vidro,veiculo_air, veiculo_abs, veiculo_trava, veiculo_aro,veiculo_gas,veiculo_direcao, condutor_nome, condutor_nascimento,condutor_sexo, condutor_estadocivil, condutor_cpf, condutor_relacao
   end   
   
   validates_presence_of :nome
   
   def persisted?
     false
   end
end