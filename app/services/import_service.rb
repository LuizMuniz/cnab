class ImportService < ApplicationService

  def initialize arquivo
    @arquivo = arquivo
  end

  def call
    unless self.validateExtension
      return false
    end

    nome_arquivo = self.salvar_em_disco
    response = self.salvar_no_banco nome_arquivo
  end

  def salvar_em_disco
    caminho = "public/uploads/"
    arquivo_nome = "dados_#{Time.now.to_i}.txt"
    caminho = File.join(Rails.root, caminho, arquivo_nome)
    File.open(caminho, "wb") do |f|
      f.write(@arquivo.read)
    end

    arquivo_nome
  end

  def salvar_no_banco arquivo

    response = {
      total: 0,
      receita: 0,
      lote: Time.now.to_i
    }

    open("#{Rails.root}/public/uploads/#{arquivo}") do |file|
      file.each_with_index do |linha, i|
        next if i == 0
        coluna = linha.split("\t")
        pessoa = FinancialOperation.new
        pessoa.type = coluna[0]
        pessoa.date = coluna[1]
        pessoa.value = coluna[2].to_f
        pessoa.cpf = coluna[3]
        pessoa.card = coluna[4]
        pessoa.ocurrence_time = coluna[5]
        pessoa.store_owner = coluna[6]
        pessoa.store_name = coluna[7]
        response[:total] += 1
        response[:receita] += (pessoa.value)
      end
    end
    response
  end

  def validateExtension
    allow_extensions = ['.txt']
    if allow_extensions.include? File.extname(@arquivo.original_filename)
      true
    end
  end
end
