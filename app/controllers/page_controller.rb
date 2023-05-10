require 'buttercms-ruby'
ButterCMS::api_token = ENV["BUTTER_API_TOKEN"]

class PageController < ApplicationController

  def index
    slug = params[:slug] || 'home-page'
    params = {
      "page": 1,
      "page_size": 10,
      "preview": 1
    }

    page = ButterCMS::Page.get('*', slug)
    content = ButterCMS::Content.list('menu')
    testimonial = ButterCMS::Content.list('testimonial', params)

    @page = page.data
    @our_offer = page.data.fields.body.find { |obj| obj.type == "features" }
    @hero = page.data.fields.body.find { |obj| obj.type == "hero" }
    @menu = content.items.first.data[1].first.menu_items
    @testimonial = testimonial.items.first.data[1]

    rescue ActionView::Template::Error => e
      raise ButterCmsError::MissingComponentPartial, e
    end

    def not_found
      render '404', layout: false
    end
  end