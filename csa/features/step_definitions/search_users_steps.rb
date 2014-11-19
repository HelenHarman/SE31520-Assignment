When /^I type "([^\"]*)" into the search field "([^\"]*)" and I choose "([^\"]*)"$/ do |data, search_field, select_user|
    # fill_in("#{search_field}", :with => data)
    
    
    fill_autocomplete(search_field, :with => data)
    #page.execute_script("$('input[data-autocomplete]').trigger(\"focus\")")#"jQuery(#{search_field}).trigger(\"click\")")
    #save_and_open_page
    # execute_script("(#q)[0].trigger('focus')")#$(#{search_field}).trigger('focus')
    # fill_in("#{search_field}", :with => data)
    #sleep 1
    #page.execute_script %Q{ $('.ui-menu-item a:contains("#{select_user}")').trigger("mouseenter").trigger("click"); }
    #save_and_open_page
    # find(:xpath, '//img[@title="Image of Chris Loftus"]').click
    #click_link(link)
    #page.execute_script %Q{ $('input[data-autocomplete]').trigger("focus") }
    #fill_in("#{search_field}", :with => data)
    #page.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("keydown") }
    #sleep 1
    #page.driver.browser.execute_script %Q{ $('.ui-menu-item a:contains("#{select_user}")').trigger("mouseenter").trigger("click"); }
end


def fill_autocomplete(field, options = {})
    fill_in field, with: options[:with]
    
    page.execute_script %Q{ $('#{field}').trigger('focus') }
    page.execute_script %Q{ $('#{field}').trigger('keydown') }
    selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
    sleep 1
    page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
    
    
    # used for debugging. Should use another step :)
    assert page.has_content?('622422')
    #sleep 100
end