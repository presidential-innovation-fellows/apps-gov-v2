agencies = [
  {
    code: "CFPB",
    name: "Consumer Financial Protection Bureau"
  }, {
    code: "CNSC",
    name: "Corporation for National and Community Service"
  }, {
    code: "DHA",
    name: "Defense Health Agency"
  }, {
    code: "DOC",
    name: "Department of Commerce"
  }, {
    code: "DOD",
    name: "Departmnet of Defense"
  }, {
    code: "DOE",
    name: "Department of Energy"
  }, {
    code: "DOI",
    name: "Department of the Interior"
  }, {
    code: "DOJ",
    name: "Department of Justice"
  }, {
    code: "DOL",
    name: "Department of Labor"
  }, {
    code: "ED",
    name: "Department of Education"
  }, {
    code: "FDA",
    name: "Food and Drug Adminstration"
  }, {
    code: "FEMA",
    name: "Federal Emergency Management Agency"
  }, {
    code: "GSA",
    name: "General Services Adminstration"
  }, {
    code: "HHS",
    name: "Health and Human Services"
  }, {
    code: "IRS",
    name: "Internal Revenue Service"
  }, {
    code: "MCC",
    name: "Millennium Challenge Corporation"
  }, {
    code: "NARA",
    name: "National Archives and Records Administration"
  }, {
    code: "NASA",
    name: "National Air and Space Administration"
  }, {
    code: "NIH",
    name: "National Institute of Health"
  }, {
    code: "NIST",
    name: "National Institute of Standards and Technology"
  }, {
    code: "NOAA",
    name: "National Oceanic and Atmospheric Administration"
  }, {
    code: "NSA",
    name: "National Security Agency"
  }, {
    code: "NSF",
    name: "National Science Foundation"
  }, {
    code: "OSTP",
    name: "Office of Science and Technology Policy"
  }, {
    code: "SBA",
    name: "Small Business Administration"
  }, {
    code: "Smithsonian",
    name: "Smithsonian"
  }, {
    code: "SSA",
    name: "Social Security Administration"
  }, {
    code: "State",
    name: "Department of State"
  }, {
    code: "Treasury",
    name: "Department of the Treasury"
  }, {
    code: "USAID",
    name: "U.S. Agency for International Development"
  }, {
    code: "USDA",
    name: "U.S. Department of Agriculture"
  }, {
    code: "USCB",
    name: "Census Bureau"
  }, {
    code: "USCIO",
    name: "USCIO"
  }, {
    code: "USPTO",
    name: "United States Postal Service"
  }, {
    code: "VA",
    name: "Department of Veteran Affairs"
  }
]

ActiveRecord::Base.transaction do
  agencies.each do |agency|
    Agency.find_or_create_by!(agency)
  end
end
