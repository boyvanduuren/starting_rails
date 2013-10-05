class Settings < Settingslogic
    source "#{Rails.root}/config/admin.yml"
    namespace Rails.env
end
