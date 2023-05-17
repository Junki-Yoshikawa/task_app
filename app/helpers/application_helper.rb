module ApplicationHelper
  def ta_t(k)
    I18n.t("labels.#{controller.controller_name}.#{controller.action_name}.#{k}")
  end

  def header_title
    I18n.t("labels.header.title.#{controller.controller_name}")
  end
end
