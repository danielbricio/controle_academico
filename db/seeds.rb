# Limpar dados existentes
Matricula.destroy_all
Disciplina.destroy_all
Aluno.destroy_all

# Criar alunos
alunos = 5.times.map do |i|
  Aluno.create(nome: "Aluno #{i+1}", idade: 20 + i, email: "aluno#{i+1}@email.com")
end

# Criar disciplinas
disciplinas = [
  { nome: "Matemática", codigo: "MAT101" },
  { nome: "Física", codigo: "FIS101" },
  { nome: "História", codigo: "HIST101" },
  { nome: "Química", codigo: "QUI101" },
  { nome: "Biologia", codigo: "BIO101" },
  { nome: "Educação Física", codigo: "EDU101" }
].map { |disciplina| Disciplina.create(disciplina) }

# Criar matrículas
alunos.each do |aluno|
  disciplinas.sample(3).each do |disciplina| # Associa 3 disciplinas aleatórias para cada aluno
    Matricula.create(aluno: aluno, disciplina: disciplina)
  end
end
