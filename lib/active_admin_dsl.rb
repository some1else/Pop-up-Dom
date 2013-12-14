class ActiveAdmin::DSLHelper
  def my_t(model, prop)
    proc { 
      if I18n.locale == :en
        if not model["#{prop.to_s}_en".to_sym].nil?
          model["#{prop.to_s}_en".to_sym]
        else
          if not model["#{prop.to_s}_si".to_sym].nil?
            model["#{prop.to_s}_si".to_sym]
          else
            ''
          end
        end
      else
        if not model["#{prop.to_s}_si".to_sym].nil?
          model["#{prop.to_s}_si".to_sym]
        else
          if not model["#{prop.to_s}_en".to_sym].nil?
            model["#{prop.to_s}_en".to_sym]
          else
            ''
          end
        end
      end
    }
  end
end