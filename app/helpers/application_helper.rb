# frozen_string_literal: true

module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [400, 400])
    else
      asset_path('user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [50, 50])
    else
      asset_path('user.png')
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  # Возвращает адрес рандомной фотки события, если есть хотя бы одна
  # Или ссылку на картинку по умолчанию
  #   def event_photo(event)
  #     photos = event.photos.persisted
  #
  #     if photos.any?
  #       photos.sample.photo.url
  #     else
  #       asset_path('event.jpg')
  #     end
  #   end
  #
  #   # Возвращает миниатюрную версию фотки
  #   def event_thumb(event)
  #     photos = event.photos.persisted
  #
  #     if photos.any?
  #       photos.sample.photo.thumb.url
  #     else
  #       asset_path('event_thumb.jpg')
  #     end
  #   end
end
