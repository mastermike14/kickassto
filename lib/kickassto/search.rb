require 'nokogiri'
require 'rest_client'

module KickassTo
  class Search
    attr_reader :torrents
    alias_method :results, :torrents

    def initialize(query, category = "all", sort_by = "seeders")

      query = URI.escape(query)
      path = 'http://kickass.to/usearch/' + query + '%20category:' + category + '/?field=' + sort_by + '&sorder=desc'
      doc = Nokogiri::HTML(RestClient.get path)
      torrents = []

      doc.css("table.data tr").each do |row|
        title = row.search('.torrentname a.cellMainLink').text
        next if title == '' 

        seeders     = row.search('td')[4].text.to_i
        leechers    = row.search('td')[5].text.to_i
        magnet_link = row.search('td .iaconbox a.imagnet')[0]['href']
        category    = row.search('td .torrentname span strong a')[0].text
        url         = row.search('.torrentname .torType').attribute('href').to_s
        torrent_id  = url[(url.rindex('-')+1)..(url.index('.html')-1)]

        torrent = {:title       => title,
                   :seeders     => seeders,
                   :leechers    => leechers,
                   :magnet_link => magnet_link,
                   :category    => category,
                   :torrent_id  => torrent_id,
                   :url         => url}

        torrents.push(torrent)
      end

      @torrents = torrents
    end
  end
end
