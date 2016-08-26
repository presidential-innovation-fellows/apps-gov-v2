ato_types = [
  {
    description: "Agency ATOs are issued and approved at the agency head or delegated authority level. The process in which agencies follow to appropriately assess an IT system may vary based on the controls and mechanisms for each agency.",
    name: "Agency Approval"
  }, {
    description: "Cloud systems listed under the Agency Authorization have worked directly with a customer agency to achieve a FedRAMP compliant ATO that has been verified by the FedRAMP PMO.",
    name: "FedRAMP (Agency)"
  }, {
    description: "Cloud systems listed under the CSP Supplied Package path have submitted to the FedRAMP PMO a completed Security Assessment Package (SAP) that has been assessed by a FedRAMP accredited 3PAO.",
    name: "FedRAMP (CSP Package)"
  }, {
    description: "Cloud systems listed under the FedRAMP P-ATO path have undergone a rigorous technical review by the FedRAMP PMO, been assessed by a FedRAMP accredited 3PAO, and received a P-ATO from the DHS, DOD, and GSA CIOs.",
    name: "FedRAMP (JAB)"
  }
]

ActiveRecord::Base.transaction do
  ato_types.each do |ato_type|
    AtoType.first_or_create!(ato_type)
  end
end
