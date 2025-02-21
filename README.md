# 📚 **Controle Acadêmico - Ruby on Rails**

## 📌 **Sobre o Projeto**
Desenvolvi esta aplicação como parte da **terceira avaliação da disciplina de Programação Web**, no **4º semestre do curso de Ciência da Computação**. O objetivo era criar um sistema utilizando **Ruby on Rails** para gerenciar **alunos, disciplinas e matrículas**, permitindo operações como **cadastro, edição, remoção e consulta de registros**.

A avaliação exigia a implementação de funcionalidades como **paginação, exportação de dados e geração de PDFs**. Desenvolvi o projeto **individualmente**, garantindo que todas as funcionalidades fossem implementadas corretamente dentro do prazo estabelecido.

- **Nota obtida**: **9.0/10**
- **Tecnologia principal**: **Ruby on Rails**



## 🖥️ **Visão Geral da Aplicação**

### **Página Inicial**
![Página Inicial](https://github.com/user-attachments/assets/f1bcaf4f-1c75-443f-a49d-54b7e78021a7)
A página inicial fornece acesso rápido às principais funcionalidades do sistema. Com um layout simples e intuitivo, apresenta três seções principais:
- **Gerenciar Alunos** – Acesso à listagem e gestão de alunos cadastrados.
- **Gerenciar Disciplinas** – Permite visualizar e administrar as disciplinas disponíveis.
- **Gerenciar Matrículas** – Controla as associações entre alunos e disciplinas.

Além disso, há um botão para **exportação de dados em CSV**, permitindo armazenar e analisar informações externamente.

### **Gerenciamento de Alunos**
![Lista de Alunos](https://github.com/user-attachments/assets/5656ab13-f6f3-4f55-bef7-269f1157694a)
A listagem de alunos exibe os registros cadastrados, incluindo:
- **Idade**, **nome** e **e-mail** do aluno.
- Opções de **visualização, edição e exclusão**.
- Exportação da lista em **PDF** para geração de relatórios.

O sistema conta com um design intuitivo e funcional, garantindo uma experiência de navegação eficiente.

### **Gerenciamento de Disciplinas**
![Lista de Disciplinas](https://github.com/user-attachments/assets/77a26036-b375-4b55-8013-64d6b324d16e)
A tela de disciplinas permite o gerenciamento das matérias disponíveis no sistema, oferecendo:
- **Cadastro, edição e remoção de disciplinas**.
- **Código único para cada disciplina**.
- **Paginação** para melhor navegação entre registros.

### **Gerenciamento de Matrículas**
![Lista de Matrículas](https://github.com/user-attachments/assets/eb5b2e16-5d25-4f79-b7fc-2202009ef9ab)
A listagem de matrículas exibe as associações entre alunos e disciplinas, representando o relacionamento **N para N**. Recursos disponíveis:
- **Visualizar, editar e excluir matrículas**.
- **Cadastro de novas matrículas** com um clique.
- **Paginação para facilitar a navegação** em grandes volumes de dados.



## 🛠️ **Funcionalidades Implementadas**
- **Gerenciamento Completo** – Cadastro, edição, exclusão e listagem de **alunos, disciplinas e matrículas**.
- **Relacionamento N para N** – Matrículas conectam alunos e disciplinas corretamente.
- **Paginação** – Implementada com **Kaminari** para otimizar a navegação.
- **Exportação de Dados** – Geração de arquivos **CSV** para manipulação externa.
- **Relatórios em PDF** – Utilização da gem **Prawn** para criar relatórios formatados.
- **Validações e Associações** – Garantia de integridade dos dados no banco.

🔹 **Funcionalidade não implementada**:
- ❌ **Autenticação** – Não inclui login de usuários via **Devise**.



## 💻 **Tecnologias Utilizadas**
| Tecnologia     | Descrição |
|---------------|--------------------------------|
| **Ruby on Rails** | Framework principal da aplicação. |
| **MySQL**      | Banco de dados relacional. |
| **Kaminari**   | Paginação eficiente para grandes listagens. |
| **Prawn**      | Geração de relatórios em PDF. |
| **Turbo Rails** | Atualizações dinâmicas na interface. |
| **Stimulus Rails** | Interatividade no frontend com JavaScript. |
| **Docker**     | Contêinerização da aplicação. |



## 🏗️ **Estrutura do Projeto**
A aplicação segue a estrutura padrão do **Ruby on Rails**, organizada da seguinte forma:

- **`app/`** → Contém os **models, views e controllers** da aplicação.
- **`config/`** → Arquivos de configuração, incluindo **banco de dados e rotas**.
- **`db/`** → Estrutura do banco de dados (**migrations, schema e seeds**).
- **`public/`** → Arquivos estáticos acessíveis publicamente.
- **`test/`** → Testes automatizados.
- **`log/`** → Armazena logs de execução.
- **`storage/`** → Diretório utilizado para armazenamento temporário.
- **`Dockerfile`** → Configuração para execução em **Docker**.
- **`Gemfile`** → Lista e gerencia as dependências (**gems**).
- **`README.md`** → Documentação da aplicação.



## 🖥️ **Instalação e Execução**

### 🔹 **1. Clonar o Repositório**
```bash
git clone https://github.com/danielbricio/controle_academico.git
cd controle_academico
```

### 🔹 **2. Instalar as Dependências**
```bash
bundle install
```

### 🔹 **3. Configurar o Banco de Dados**
```bash
rails db:create db:migrate db:seed
```

### 🔹 **4. Iniciar o Servidor**
```bash
rails server
```
Acesse em: [http://localhost:3000](http://localhost:3000)



## 🏆 **Conclusão**

Desenvolver esta aplicação foi um grande aprendizado, pois realizei todo o trabalho de forma independente. Aprofundei meus conhecimentos em **Ruby on Rails, modelagem de banco de dados, CRUD e lógica de programação**, além de aprimorar o uso de **MySQL, Kaminari, Turbo Rails, Stimulus e Prawn**. Foi muito bom ver o sistema funcionando conforme eu tinha planejado e conforme foi solicidade pelo professor.
