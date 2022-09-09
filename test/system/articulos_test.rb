require "application_system_test_case"

class ArticulosTest < ApplicationSystemTestCase
  setup do
    @articulo = articulos(:one)
  end

  test "visiting the index" do
    visit articulos_url
    assert_selector "h1", text: "Articulos"
  end

  test "should create articulo" do
    visit articulos_url
    click_on "New articulo"

    fill_in "Contenido", with: @articulo.contenido
    fill_in "Date", with: @articulo.date
    fill_in "Fecha publicacion", with: @articulo.fecha_publicacion
    fill_in "Titulo", with: @articulo.titulo
    click_on "Create Articulo"

    assert_text "Articulo was successfully created"
    click_on "Back"
  end

  test "should update Articulo" do
    visit articulo_url(@articulo)
    click_on "Edit this articulo", match: :first

    fill_in "Contenido", with: @articulo.contenido
    fill_in "Date", with: @articulo.date
    fill_in "Fecha publicacion", with: @articulo.fecha_publicacion
    fill_in "Titulo", with: @articulo.titulo
    click_on "Update Articulo"

    assert_text "Articulo was successfully updated"
    click_on "Back"
  end

  test "should destroy Articulo" do
    visit articulo_url(@articulo)
    click_on "Destroy this articulo", match: :first

    assert_text "Articulo was successfully destroyed"
  end
end
