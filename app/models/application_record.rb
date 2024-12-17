class ApplicationRecord < ActiveRecord::Base
  # Define a classe base abstrata para todos os modelos do ActiveRecord.
  # Isso significa que outros modelos da aplicação irão herdar desta classe.
  primary_abstract_class
end
