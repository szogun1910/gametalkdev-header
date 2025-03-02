# name: Custom Header
# about: Plugin dodający własny nagłówek do Discourse
# version: 0.1
# authors: Szogun

register_asset "stylesheets/custom-header.css"

register_site_setting :enable_custom_header, default: true, type: :boolean
register_site_setting :custom_header_logo_url, default: "http://gametalkdev.pl/images/discourse-logo-sketch.png", type: :string
register_site_setting :header_background_color, default: "#f0f0f0", type: :string
register_site_setting :header_text_color, default: "#333", type: :string
register_site_setting :dark_mode_button_text, default: "🌙", type: :string

register_site_setting :custom_header_about_link, default: "/about", type: :string
register_site_setting :custom_header_projects_link, default: "/projects", type: :string
register_site_setting :custom_header_store_link, default: "/store", type: :string
register_site_setting :custom_header_blog_link, default: "/blog", type: :string
register_site_setting :custom_header_contact_link, default: "/contact", type: :string

after_initialize do
  if SiteSetting.enable_custom_header
    DiscoursePluginRegistry.register_html_partial "header", <<-HTML
      <div class="custom-header" style="background-color: #{SiteSetting.header_background_color}; color: #{SiteSetting.header_text_color};">
        <div class="logo">
          <img src="#{SiteSetting.custom_header_logo_url}" alt="<%= I18n.t('custom_header.logo_alt_text') %>">
          <span>Codey</span>
        </div>
        <div class="navigation">
          <a href="#{SiteSetting.custom_header_about_link}"> <%= I18n.t('custom_header.about') %> </a>
          <a href="#{SiteSetting.custom_header_projects_link}" class="active"> <%= I18n.t('custom_header.projects') %> </a>
          <a href="#{SiteSetting.custom_header_store_link}"> <%= I18n.t('custom_header.store') %> </a>
          <a href="#{SiteSetting.custom_header_blog_link}"> <%= I18n.t('custom_header.blog') %> </a>
          <a href="#{SiteSetting.custom_header_contact_link}"> <%= I18n.t('custom_header.contact') %> </a>
        </div>
        <div class="search">
          <input type="text" placeholder="<%= I18n.t('custom_header.search_placeholder') %>">
        </div>
        <div class="icons">
          <button class="dark-mode-toggle"> <%= I18n.t('custom_header.dark_mode_button_text') %> </button>
        </div>
        <div class="social-media-icons">
          <a href="https://facebook.com" target="_blank"><i class="fa fa-facebook"></i></a>
          <a href="https://twitter.com" target="_blank"><i class="fa fa-twitter"></i></a>
        </div>
        <div class="user-auth">
          <% if current_user %>
            <a href="/u/#{current_user.username}">Profil</a>
            <a href="/logout">Wyloguj</a>
          <% else %>
            <a href="/login">Zaloguj się</a>
            <a href="/signup">Zarejestruj się</a>
          <% end %>
        </div>
      </div>
    HTML
  end
end
