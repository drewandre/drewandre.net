require 'yaml'

helpers do
  def img(folder, file)
    title = File.basename(file,File.extname(file)).gsub(/[_-]/, ' ').split.map(&:capitalize).join(' ')
    return (
      "<div class='work-link'>
        <img class='work-tile' src='/projects/#{folder}/#{file}' alt='#{title}'/>
      </div>"
    )
  end

  def gather_all_images_from(folder)
    images = []
    Dir.foreach("public/projects/#{folder}") do |file|
      next if file == '.' or file == '..'
      description = YAML::load_file "public/projects/#{folder}/description.yml"
      case File.extname(file)
      when '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff'
        images.push(img(folder, file))
      end
    end
    return images
  end

  def top_img(folder, project, file, description)
    title = File.basename(file,File.extname(file)).gsub(/[_-]/, ' ').split.map(&:capitalize).join(' ')
    return (
      "<a class='work-link' href='#{folder}/#{project}'>
        <div class='work-image'>
          <img class='work-tile' src='/projects/#{folder}/#{project}/#{file}' alt='#{title}'/>
          <div id='work-text'>
            <h4>#{description['title']}</h4>
          </div>
        </div>
      </a>"
    )
  end

  def gather_top_images_from(folder)
    images = []
    Dir.foreach("public/projects/#{folder}") do |project|
      next if project == '.' or project == '..'
      Dir.foreach("public/projects/#{folder}/#{project}") do |file|
        next if file == '.' or file == '..'
        description = YAML::load_file "public/projects/#{folder}/#{project}/description.yml"
        case File.extname(file)
        when '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff'
          if File.basename(file, File.extname(file)).start_with?('top')
            images.push(top_img(folder, project, file, description))
          end
        end
      end
    end
    return images
  end

end
