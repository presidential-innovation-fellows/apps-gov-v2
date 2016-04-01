agencies = [
  {
    code: "DOC",
    name: "Department of Commerce"
  }, {
    code: "DOE",
    name: "Department of Energy"
  }, {
    code: "DOI",
    name: "Department of the Interior"
  }, {
    code: "DOL",
    name: "Department of Labor"
  }, {
    code: "FDA",
    name: "Food and Drug Adminstration"
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
    code: "OSTP",
    name: "Office of Science and Technology Policy"
  }, {
    code: "Smithsonian",
    name: "Smithsonian"
  }, {
    code: "State",
    name: "Department of State"
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
    Agency.create!(agency)
  end
end
