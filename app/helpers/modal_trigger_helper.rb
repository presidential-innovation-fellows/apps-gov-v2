module ModalTriggerHelper
  def modal_link(text, path, modal_id)
    link_to text, path, class: "modal-trigger", data: { modal_id: modal_id }
  end
end
