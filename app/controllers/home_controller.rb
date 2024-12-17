class HomeController < ApplicationController
  # Ação index: responsável por ler e exibir o conteúdo de um arquivo específico
  def index
    # Define o caminho do arquivo no diretório 'public'
    file_path = Rails.root.join('public', 'sample.txt')
    # file_path é um caminho absoluto para 'public/sample.txt' no projeto Rails

    # Verifica se o arquivo existe no caminho especificado
    if File.exist?(file_path)
      # Lê o conteúdo do arquivo e armazena na variável de instância @file_content
      @file_content = File.read(file_path)
    else
      # Caso o arquivo não exista, define uma mensagem padrão
      @file_content = 'Arquivo não encontrado.'
    end
  end
end
