- dashboard: sessions
  title: GA4 Sessions
  layout: newspaper
  preferred_viewer: dashboards-next

  elements:
  - title: User Count
    name: User Count
    model: medicare_ga4_model
    explore: sessions
    type: single_value
    fields: [sessions.total_users]
