module ImageHelper
  def social_image(provider)
    if image_exists?(provider)
      image_tag "#{provider}.png"
    else
      fa_icon provider
    end
  end

  def image_exists?(img, extension: "png")
    File.exist?(Rails.root + "app/assets/images/#{img}.#{extension}")
  end
end
