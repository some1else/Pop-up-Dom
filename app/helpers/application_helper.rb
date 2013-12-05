module ApplicationHelper
  def my_t(model, prop)

    if I18n.locale == :sl
      if not model["#{prop.to_s}_sl".to_sym].nil?
        model["#{prop.to_s}_sl".to_sym]
      else
        if not model["#{prop.to_s}_en".to_sym].nil?
          model["#{prop.to_s}_en".to_sym]
        else
          'HHa'
        end
      end
    else
      if not model["#{prop.to_s}_en".to_sym].nil?
        model["#{prop.to_s}_en".to_sym]
      else
        if not model["#{prop.to_s}_sl".to_sym].nil?
          model["#{prop.to_s}_sl".to_sym]
        else
          'HHb'
        end
      end
    end
  end
end
