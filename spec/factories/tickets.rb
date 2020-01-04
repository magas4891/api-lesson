FactoryBot.define do
  factory :ticket do
    factory :valid_ticket do
      request_number { "09252012-00001" }
      sequence_number { "2421" }
      request_type { "Normal" }
      date_times { { "ResponseDueDateTime":"2011/07/13 23:59:59" } }
      service_area { { "PrimaryServiceAreaCode":{"SACode":"ZZGL103"},
                       "AdditionalServiceAreaCodes":{
                           "SACode":["ZZL01","ZZL02","ZZL03"]
                       } } }
      digsite_info { { "WellKnownText":"POLYGON((35.136056 47.847517))" } }
    end
  end
end
