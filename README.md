kickassto Ruby gem
=============

Get torrent information from Kickass.to

Installation
------------
    gem install kickassto


Usage Examples
--------------
    require 'kickassto'

    # Search for torrents, returns array
    KickassTo::Search.new('query').results

    # Sort and category are optional - (query, category, sort_by)
    KickassTo::Search.new('query', KickassTo::Category::Movies, KickassTo::SortBy::Seeders).results

    # Sortings options available:
    KickassTo::SortBy::Size       = Files size (desc)
    KickassTo::SortBy::Seeders    = Number of seeders (desc)
    KickassTo::SortBy::Leechers   = Number of leechers (desc)
    KickassTo::SortBy::Age        = Date added (desc)
    KickassTo::SortBy::Files      = Number of files in the torrent (desc)

    # Categories available:
    KickassTo::Category::Movies         
    KickassTo::Category::TV             
    KickassTo::Category::Music          
    KickassTo::Category::Books          
    KickassTo::Category::Games          
    KickassTo::Category::Apps
    KickassTo::Category::XXX 
    
Dependencies
------------

nokogiri & rest_client gems
