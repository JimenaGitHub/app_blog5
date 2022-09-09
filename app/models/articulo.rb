class Articulo < ApplicationRecord
def self.buscar(texto)
    if texto and !texto.empty? 
      articulo_encontrado = Articulo.where(
        "titulo LIKE ? or titulo LIKE?", "#{texto.capitalize}%", "%#{texto.downcase}%"
      )
      if articulo_encontrado
        articulo_encontrado 
      else
        Articulo.all
      end
    else
        Articulo.all

        end
    end
end
    
