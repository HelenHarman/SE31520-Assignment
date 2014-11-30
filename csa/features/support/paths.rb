module NavigationHelpers
    # used for cucumber testing, to check what page we are on, and to visit a page
    def path_to(page_name)
        case page_name
            
            # handle home page request
            when /the home\s?page/
                root_path
            when /home\s?page/
                home_path
            # handle new session page request
            when /the login\s?page/
                new_session_path
               
            # handle a user's page request
            when /users\s?page/
                users_path
            when /user "\d+" page/
            begin
                /(?<user_id>\d+)/ =~ page_name
                user_path(:id => user_id)
            end
            
            # handle a user's edit page request
            when /user "\d+" edit page/
            begin
                /(?<user_id>\d+)/ =~ page_name
                edit_user_path(:id => user_id)
            end
            
            # handle a broadcasts page request
            when /broadcasts page/
                broadcasts_path
            when /broadcast "\d+" page/
            begin
                /(?<broadcast_id>\d+)/ =~ page_name
                broadcast_path(:id => broadcast_id)
            end

            else #The defualt will add unscores to the page name and try to visit the page.
                 # if the page is not found error will be thrown
            begin
                page_name =~ /the (.*) page/
                path_components = $1.split(/\s+/)
                self.send(path_components.push('path').join('_').to_sym)
                rescue Object => e
                    raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                "Now, go and add a mapping in #{__FILE__}"
            end
        end
    end
end

World(NavigationHelpers)