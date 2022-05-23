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
      receita: 0
    }

    open("#{Rails.root}/public/uploads/#{arquivo}") do |file|
      file.each_with_index do |linha, i|
        ocurrence_time = linha[42..47]
        hour = "#{ocurrence_time[0]}#{ocurrence_time[1]}:#{ocurrence_time[2]}
                                    #{ocurrence_time[3]}:#{ocurrence_time[4]}#{ocurrence_time[5]}"
        
        params = {
          type: linha[0],
          date: linha[1..8],
          value: linha[9..18].to_f / 100,
          cpf: linha[19..29],
          card: linha[30..41],
          ocurrence_time: hour,
          store_owner: linha[48..61],
          store_name: linha[62..80],
        }
        financial_operation = FinancialOperation.new(params)
        financial_operation.save
        response[:total] += 1
        response[:receita] += (params[:value])
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
