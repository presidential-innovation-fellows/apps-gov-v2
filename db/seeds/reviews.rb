reviews = [
  {
    description: '<p>When selling to the federal government, companies will often be required to negotiate a federal-compatible Terms of Service. A list of approved negotiated ToS can be found at <a href="http://www.digitalgov.gov/resources/negotiated-terms-of-service-agreements/" target="blank">digitalgov.gov</a>, which may not be fully encompassing. Additionally, because negotiated TOS are often determined at the agency level (requiring agency legal review), there are POCs for each agency, identified <a href="http://www.digitalgov.gov/resources/agency-points-of-contact-for-federal-compatible-terms-of-service-agreements/" target="blank">here</a>.</p>',
    name: 'Federally-compatible ToS',
    slug: 'gov_tos'
  }, {
    description: '<p>A Privacy Threshold Analysis (PTA) document is a form used for all information technology systems that are going through the certification and accreditation (C&amp;A) process required under the Federal Information Security Management Act (FISMA), to determine whether they properly maintain personally identifiable information (PII). The PTA includes a description of the system, what PII, if any, is collected or used, and from whom.</p>',
    name: 'Privacy Threshold Analysis',
    slug: 'pta'
  }, {
    description: '<p>When personal information on individuals is collected and used as a part of a system, the product team is required to conduct a Privacy Impact Assessment (reference: <a href="https://www.whitehouse.gov/omb/memoranda_m03-22" target="blank">E-Government Act of 2002</a>). A PIA or Adapted PIA may need to be written for any IT system that collects, stores, and makes retrievable people’s personally identifiable information. Further work and approval from the agency’s Chief Privacy Officer may be required. The PIA explains:</p><ul><li>The information collected is used only for the intended purpose;</li><li>The information is timely and accurate;</li><li>The information is protected according to applicable laws and regulations while in GSA’s possession;</li><li>The impact of the information systems on individual privacy is fully addressed; and</li><li>The public is aware of the information GSA collects and how the information is used.</li><li>Further work and approval from the agency’s Chief Privacy Officer may be required.</li></ul>',
    name: 'Privacy Impact Assessment',
    slug: 'pia'
  }, {
    description: '<p>Regulates the collection, maintenance, use, and dissemination of personally identifiable information (PII) about people (referred to as a “system of records”) by the government. A SORN may be required when collecting, storing, and making retrievable people’s personally identifiable information. More information regarding SORNs can be found <a href="http://www.gsa.gov/portal/content/104265" target="blank">here</a>.</p><ul><li>A System of Record is created when a group of information is collected and stored in a way that can be retrieved by the name of an individual, or by any number, symbol, or other unique identifier assigned to that individual.</li><li>The Privacy Act requires that any system of record be publicized via a SORN, which is a notice published to the Federal Register for public comment. This process lasts a minimum of 60 days.</li><li>Further work and approval from the agency’s Chief Privacy Officer may be required.</li></ul>',
    name: 'Systems of Record Notice (SORN)',
    slug: 'sorn'
  }
]

ActiveRecord::Base.transaction do
  reviews.each do |review|
    Review.first_or_create!(review)
  end
end
