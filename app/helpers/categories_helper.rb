module CategoriesHelper
  def group_avatar(icon)
    if icon.present?
      image_tag(url_for(icon), alt: 'icon', class: 'img')
    else
      image_tag('default_icon.jpg', alt: 'icon', class: 'img')
    end
  end
end
