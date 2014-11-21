def search_and_click_on_user(field, options = {})
    fill_in field, with: options[:with]
    
    page.execute_script %Q{ $('#{field}').trigger('focus') }
    page.execute_script %Q{ $('#{field}').trigger('keydown') }
    selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
    sleep 1
    page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end