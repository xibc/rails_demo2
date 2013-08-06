class Movie < ActiveResource::Base
  self.site  = "http://mymovieapi.com"
  self.timeout = 15
  self.format = :json

  class << self
    def collection_path(prefix_options = {}, query_options = nil)
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      "#{prefix(prefix_options)}#{query_string(query_options)}"
    end

    def element_path(id, prefix_options = {}, query_options = nil)
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      "#{prefix(prefix_options)}#{query_string(query_options)}"
    end

    def find_by_title(title)
      begin
        find :all, params: { q: title}
      rescue
        []
      end
    end

    def find_by_ids(ids)
      ids = ids.join(',') if ids.class == Array
      find :all, params: { ids: ids}
    end
  
    def find_by_id(id, business=0, technical=0)
      find(:first, params: { ids: id, business: business, tech: technical})
    end
  end

  def poster_url
    return 'not found' unless respond_to? :poster
    begin
      poster.small 
    rescue
      begin
        poster.cover 
      rescue
        poster.source
      end
    end
  end

end
