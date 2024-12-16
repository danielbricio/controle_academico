class HomeController < ApplicationController
  def index
    # Caminho do arquivo simples
    file_path = Rails.root.join('public', 'sample.txt')

    if File.exist?(file_path)
      @file_content = File.read(file_path) # Lê o conteúdo do arquivo
    else
      @file_content = 'Arquivo não encontrado.'
    end
  end
end