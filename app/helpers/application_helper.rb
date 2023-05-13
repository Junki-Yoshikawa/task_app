module ApplicationHelper
    def ta_t(k)
        I18n.t("labels.#{controller.controller_name}.#{controller.action_name}.#{k}")
    end
end
