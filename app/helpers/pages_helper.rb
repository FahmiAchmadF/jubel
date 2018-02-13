module PagesHelper
  def has_photo?(photo)
    photo.nil? ? "https://picsum.photos/348/217.5" : photo
  end
end
