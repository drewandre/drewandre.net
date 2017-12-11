require 'yaml'

helpers do
  def create_tools_icons(description, pageType)
    tools = []
    toolList = ""
    combinedToolString = ""
    separatedToolList = []
    if description['tools'] != nil
      tools << "Frameworks"
      description['tools'].split(', ').each do |tool|
        toolList += "<div id='tool'>#{tool}</div>"
        combinedToolString += "<div id='tool'>#{tool}</div>"
      end
      tools << toolList
      separatedToolList << tools
      tools = []
      toolList = ""
    end
    if description['libraries'] != nil
      tools << "Libraries"
      description['libraries'].split(', ').each do |library|
        toolList += "<div id='library'>#{library}</div>"
        combinedToolString += "<div id='library'>#{library}</div>"
      end
      tools << toolList
      separatedToolList << tools
      tools = []
      toolList = ""
    end
    if description['hardware'] != nil
      tools << "Hardware"
      description['hardware'].split(', ').each do |hardware|
        toolList += "<div id='hardware'>#{hardware}</div>"
        combinedToolString += "<div id='hardware'>#{hardware}</div>"
      end
      tools << toolList
      separatedToolList << tools
      tools = []
      toolList = ""
    end
    if pageType == "index"
      return combinedToolString
    else
      return separatedToolList
    end
  end

  def create_vimeo_iframes(description)
    videos = []
    description['vimeo_urls'].split(', ').each do |url|
      videos.push(vimeo_iframe(url))
    end
    return videos
  end

  def vimeo_iframe(url)
    return (
      "<div class='work-static'>
        <div class='vimeo-container'>
          <iframe class='vimeo-iframe' src='https://player.vimeo.com/video/#{url}'
            frameborder='0'
            webkitallowfullscreen
            mozallowfullscreen
            allowfullscreen
          ></iframe>
        </div>
      </div>"
    )
  end

  def img(folder, file)
    title = File.basename(file,File.extname(file)).gsub(/[_-]/, ' ').split.map(&:capitalize).join(' ')
    return (
      "<div class='work-static'>
        <img class='work-tile' src='/projects/#{folder}/#{file}' alt='#{title}'/>
      </div>"
    )
  end

  def vid(folder, file)
    title = File.basename(file,File.extname(file)).gsub(/[_-]/, ' ').split.map(&:capitalize).join(' ')
    return (
      "<div class='work-static'>
        <video controls width='100%'>
          <source src='/projects/#{folder}/#{file}' alt='#{title}' type='video/mp4'>
        </video>
      </div>"
    )
  end

  def gather_all_media_from(folder)
    media = []
    Dir.foreach("public/projects/#{folder}") do |file|
      next if file == '.' or file == '..'
      case File.extname(file)
      when '.jpg', '.JPG', '.jpeg', '.png', '.gif', '.bmp', '.tiff'
        if File.basename(file, File.extname(file)).start_with?('top')
          media.unshift(img(folder, file))
        else
          media.push(img(folder, file))
        end
      end
    end
    return media
  end

  def top_img(folder, project, file, description)
    combinedToolsList = create_tools_icons(description, "index")
    return (
      "<a class='work-link' href='#{folder}/#{project}'>
        <div class='work-text'><h4>#{description['title']}</h4>
        <h5>#{combinedToolsList}</h5></div>
        <img class='work-tile' src='/projects/#{folder}/#{project}/#{file}' alt='#{description['title']}'/>
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
