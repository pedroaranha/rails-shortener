json.array!(@links) do |link|
  json.extract! link, :id, :short_url, :long_url, :hits, :http_status
  json.url link_url(link, format: :json)
end
