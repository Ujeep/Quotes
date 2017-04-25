module QuotesHelper
     def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_quotes_path
    elsif action_name == 'edit'
      quote_path
    end
  end
    
end
