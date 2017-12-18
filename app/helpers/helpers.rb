require 'yaml'

helpers do
  def create_about_section(yml)
    skills = []
    yml.each do |key, value|
      skillsList = []
      if value != nil
        skillString = "<div class='skills'><h5 class='skills'>#{key}</h5>"
        value.split(', ').each do |skill|
          skillString += "<div id='#{key.downcase}'>#{skill}</div>"
        end
        skillString += "</div>"
        skillsList << skillString
        skills << skillsList
      end
    end
    return skills
  end

  def create_tools_icons(tools_yml, pageType)
    currentToolsList = []
    separatedToolsList = []
    combinedToolsString = ''
    tools_yml.each do |key, value|
      currentToolsList = [key]
      separatedToolsString = ''
      if value != nil
        value.split(', ').each do |tool|
          combinedToolsString += "<div id='#{key.downcase}'>#{tool}</div>"
          separatedToolsString += "<div id='#{key.downcase}'>#{tool}</div>"
        end
        currentToolsList << separatedToolsString
        separatedToolsList << currentToolsList
      end
    end
    if pageType == "index"
      return combinedToolsString
    else
      return separatedToolsList
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

  def top_img(folder, project, file, tools, description)
    combinedToolsList = create_tools_icons(tools, "index")
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
        tools = YAML::load_file "public/projects/#{folder}/#{project}/tools.yml"
        case File.extname(file)
        when '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff'
          if File.basename(file, File.extname(file)).start_with?('top')
            images.push(top_img(folder, project, file, tools, description))
          end
        end
      end
    end
    return images
  end
end
