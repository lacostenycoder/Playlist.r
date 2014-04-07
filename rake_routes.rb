rake routes
            Prefix Verb   URI Pattern                             Controller#Action
             login GET    /login(.:format)                        sessions#new
          sessions POST   /sessions(.:format)                     sessions#create
            logout GET    /logout(.:format)                       sessions#destroy
            lookup GET    /lookup(.:format)                       featured_lists#lookup
        run_lookup GET    /run_lookup(.:format)                   featured_lists#run_lookup
    user_playlists GET    /users/:user_id/playlists(.:format)     playlists#index
                   POST   /users/:user_id/playlists(.:format)     playlists#create
 new_user_playlist GET    /users/:user_id/playlists/new(.:format) playlists#new
     edit_playlist GET    /playlists/:id/edit(.:format)           playlists#edit
          playlist GET    /playlists/:id(.:format)                playlists#show
                   PATCH  /playlists/:id(.:format)                playlists#update
                   PUT    /playlists/:id(.:format)                playlists#update
                   DELETE /playlists/:id(.:format)                playlists#destroy
             users GET    /users(.:format)                        users#index
                   POST   /users(.:format)                        users#create
          new_user GET    /users/new(.:format)                    users#new
         edit_user GET    /users/:id/edit(.:format)               users#edit
              user GET    /users/:id(.:format)                    users#show
                   PATCH  /users/:id(.:format)                    users#update
                   PUT    /users/:id(.:format)                    users#update
                   DELETE /users/:id(.:format)                    users#destroy
             songs GET    /songs(.:format)                        songs#index
                   POST   /songs(.:format)                        songs#create
          new_song GET    /songs/new(.:format)                    songs#new
         edit_song GET    /songs/:id/edit(.:format)               songs#edit
              song GET    /songs/:id(.:format)                    songs#show
                   PATCH  /songs/:id(.:format)                    songs#update
                   PUT    /songs/:id(.:format)                    songs#update
                   DELETE /songs/:id(.:format)                    songs#destroy
    featured_lists GET    /featured_lists(.:format)               featured_lists#index
                   POST   /featured_lists(.:format)               featured_lists#create
 new_featured_list GET    /featured_lists/new(.:format)           featured_lists#new
edit_featured_list GET    /featured_lists/:id/edit(.:format)      featured_lists#edit
     featured_list GET    /featured_lists/:id(.:format)           featured_lists#show
                   PATCH  /featured_lists/:id(.:format)           featured_lists#update
                   PUT    /featured_lists/:id(.:format)           featured_lists#update
                   DELETE /featured_lists/:id(.:format)           featured_lists#destroy
              root GET    /
