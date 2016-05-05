module ModalTriggerHelper
  def modal_link(html_or_text, path, modal_id)
    link_to path, class: "modal-trigger", data: { modal_id: modal_id } do
      html_or_text
    end
  end
end
