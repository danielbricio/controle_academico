# **Controle Acadêmico - Ruby on Rails**

## **Sobre o Projeto**
Desenvolvi esta aplicação como parte da **terceira avaliação da disciplina de Programação Web**, no **4º semestre do curso de Ciência da Computação**. O objetivo era criar um sistema utilizando **Ruby on Rails** para gerenciar **alunos, disciplinas e matrículas**, permitindo operações como **cadastro, edição, remoção e consulta de registros**.

A avaliação exigia a implementação de funcionalidades como **paginação, exportação de dados e geração de PDFs**. Desenvolvi o projeto **individualmente**, garantindo que todas as funcionalidades fossem implementadas corretamente dentro do prazo estabelecido.

- **Nota obtida**: **9.0/10**
- **Tecnologia principal**: **Ruby on Rails**



## **Visão Geral da Aplicação**

### **Página Inicial**
![Group 4](https://github.com/user-attachments/assets/72407dcf-d099-4d2c-82c2-87894b9478b0)
A página inicial fornece acesso rápido às principais funcionalidades do sistema. Com um layout simples e intuitivo, apresenta três seções principais:
- **Gerenciar Alunos** – Acesso à listagem e gestão de alunos cadastrados.
- **Gerenciar Disciplinas** – Permite visualizar e administrar as disciplinas disponíveis.
- **Gerenciar Matrículas** – Controla as associações entre alunos e disciplinas.

Além disso, há um botão para **exportação de dados em CSV**, permitindo armazenar e analisar informações externamente.

### **Gerenciamento de Alunos**
![Group 3](https://github.com/user-attachments/assets/eb42598d-dfec-4953-b378-5cb1892544c6)
A listagem de alunos exibe os registros cadastrados, incluindo:
- **Idade**, **nome** e **e-mail** do aluno.
- Opções de **visualização, edição e exclusão**.
- Exportação da lista em **PDF** para geração de relatórios.

O sistema conta com um design intuitivo e funcional, garantindo uma experiência de navegação eficiente.

### **Gerenciamento de Disciplinas**
![Group 2](https://github.com/user-attachments/assets/69fb9e2b-5c79-4e11-8a89-4500a3e59fe4)
A tela de disciplinas permite o gerenciamento das matérias disponíveis no sistema, oferecendo:
- **Cadastro, edição e remoção de disciplinas**.
- **Código único para cada disciplina**.
- **Paginação** para melhor navegação entre registros.

### **Gerenciamento de Matrículas**
![Group 1](https://github.com/user-attachments/assets/46e1feea-5626-472e-baac-50b27a67b458)
A listagem de matrículas exibe as associações entre alunos e disciplinas, representando o relacionamento **N para N**. Recursos disponíveis:
- **Visualizar, editar e excluir matrículas**.
- **Cadastro de novas matrículas** com um clique.
- **Paginação para facilitar a navegação** em grandes volumes de dados.



## **Funcionalidades Implementadas**
- **Gerenciamento Completo** – Cadastro, edição, exclusão e listagem de **alunos, disciplinas e matrículas**.
- **Relacionamento N para N** – Matrículas conectam alunos e disciplinas corretamente.
- **Paginação** – Implementada com **Kaminari** para otimizar a navegação.
- **Exportação de Dados** – Geração de arquivos **CSV** para manipulação externa.
- **Relatórios em PDF** – Utilização da gem **Prawn** para criar relatórios formatados.
- **Validações e Associações** – Garantia de integridade dos dados no banco.

**Funcionalidade não implementada**:
- **Autenticação** – O sistema não possui um mecanismo de autenticação para controle de acesso, como login e gerenciamento de usuários. Minha intenção era implementar essa funcionalidade utilizando a gem Devise, permitindo que apenas usuários autenticados pudessem acessar e gerenciar os dados da aplicação. No entanto, devido ao tempo limitado para a entrega do projeto, não consegui concluir essa implementação dentro do prazo. Caso tivesse mais tempo disponível, teria desenvolvido um sistema de autenticação básico, garantindo maior segurança e controle sobre as operações realizadas.



## **Tecnologias Utilizadas**
| Tecnologia     | Descrição |
|---------------|--------------------------------|
| **Ruby on Rails** | Framework principal da aplicação. |
| **MySQL**      | Banco de dados relacional. |
| **Kaminari**   | Paginação eficiente para grandes listagens. |
| **Prawn**      | Geração de relatórios em PDF. |
| **Turbo Rails** | Atualizações dinâmicas na interface. |
| **Stimulus Rails** | Interatividade no frontend com JavaScript. |
| **Docker**     | Contêinerização da aplicação. |



## **Estrutura do Projeto**
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



## **Instalação e Execução**

### **1. Clonar o Repositório**
```bash
git clone https://github.com/danielbricio/controle_academico.git
cd controle_academico
```

### **2. Instalar as Dependências**
```bash
bundle install
```

### **3. Configurar o Banco de Dados**
```bash
rails db:create db:migrate db:seed
```

### **4. Iniciar o Servidor**
```bash
rails server
```
Acesse em: [http://localhost:3000](http://localhost:3000)



## **Minhas Conclusões**

Desenvolver esse sistema foi um aprendizado incrível! Foi meu primeiro contato com Ruby on Rails, onde aprimorei lógica de programação, modelagem de banco de dados, CRUD e estruturação de código. Já conhecia MySQL desde o 3º bloco, e estudar Banco de Dados 2 ao mesmo tempo que Programação Web no 4º bloco me ajudou bastante a aplicar os conceitos na prática.

Também trabalhei com tecnologias novas pra mim, como Kaminari, Turbo Rails, Stimulus e Prawn, aprendendo suas funcionalidades e boas práticas. Desenvolvi o projeto sozinho, enquanto a turma trabalhava em dupla, o que trouxe desafios extras. Consegui implementar paginação, exportação de dados e geração de PDFs, mas não tive tempo de adicionar autenticação.

No final, ver tudo funcionando como planejado foi muito gratificante. Essa experiência reforçou meu conhecimento em Ruby on Rails e me deu mais confiança para desenvolver aplicações web do zero.
