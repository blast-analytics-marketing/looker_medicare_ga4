
## Connection Constants:

constant: GA4_CONNECTION {
  value: "cms_medicare_ga4"
  #value: "blast_ga4"
  export: override_required
}

constant: GA4_SCHEMA {
  value: "steady-cat-772.analytics_266429760"
  #value: "exalted-etching-538.analytics_206819186"
  export: override_optional
}

constant: GA4_TABLE_VARIABLE {
  value: "events_*"
  export: override_optional
}

constant: GA4_PROPERTY {
  value: "medicare.gov"
  #value: "blastanalytics.com"
  export: override_optional
}
