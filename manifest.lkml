
## Connection Constants:

constant: GA4_CONNECTION {
  value: "cms_medicare_ga4"
  export: override_required
}

constant: GA4_SCHEMA {
  value: "steady-cat-772.analytics_266429760"
  export: override_optional
}

constant: GA4_TABLE_VARIABLE {
  value: "events_*"
  export: override_optional
}

constant: GA4_PROPERTY {
  value: "medicare.gov"
  export: override_optional
}
