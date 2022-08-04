module CategoriesHelper
  def group_avatar(icon)
    if icon.present?
      image_tag(url_for(icon), alt: 'icon', class: 'thumbnail icon-img', width: '64', height: '64')
    else
      image_tag('default_icon.jpg', alt: 'icon', class: 'img')
    end
  end
end
