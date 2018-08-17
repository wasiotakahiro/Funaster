module FunastarsHelper
  def choose_new_or_edit
   if action_name == 'new' || action_name == 'confirm'
     confirm_funastars_path
   elsif action_name == 'edit'
     funastar_path
   end
 end
end
