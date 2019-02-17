class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      ### PJ ###
      t.string :cnpj, limit: 18 #[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}
      t.string :razao_social
      t.string :inscricao_estadual
      t.date :data_fundacao

      ### PF ###
      t.string :nome
      t.string :rg
      t.string :orgao_expeditor
      t.string :estado_civil
      t.string :profissao
      t.date :data_nascimento

      ### AMBOS ###
      t.string :nome_fantasia
      t.string :ramo_atividade
      t.string :inscricao_municipal
      t.string :telefone
      t.string :cpf
      t.string :cep
      t.string :estado
      t.string :cidade
      t.string :logradouro
      t.integer :numero
      t.string :complemento
      t.string :bairro
      t.string :email
      t.text :observacoes

      ### Informações de máquina ###
      t.text :primeiro_acesso
      t.text :segundo_acesso

      t.timestamps
    end

  end
end
