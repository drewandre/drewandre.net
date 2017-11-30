helpers do
  def img(category, name)
    `<img src='images/${category}/${name}' alt='${name}' />`
  end
end
