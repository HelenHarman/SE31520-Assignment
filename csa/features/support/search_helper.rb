##
# Fills in the search field and selects the user from the drop down list that appears.
def search_and_click_on_user(field, options = {})
     #fill in search field
    fill_in field, with: options[:with]
    
    # select the user
    page.execute_script %Q{ $('#{field}').trigger('focus') }
    page.execute_script %Q{ $('#{field}').trigger('keydown') }
    selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
    sleep 1
    page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end