# File generated from our OpenAPI spec
# frozen_string_literal: true

module Stripe
  class SubscriptionItem < APIResource
    extend Stripe::APIOperations::Create
    include Stripe::APIOperations::Delete
    extend Stripe::APIOperations::List
    include Stripe::APIOperations::Save
    extend Stripe::APIOperations::NestedResource

    OBJECT_NAME = "subscription_item"

    custom_method :usage_records, http_verb: :get, http_path: "usage_records"
    nested_resource_class_methods :usage_record, operations: %i[create]
    nested_resource_class_methods :usage_record_summary,
                                  operations: %i[list],
                                  resource_plural: "usage_record_summaries"

    def usage_records(params = {}, opts = {})
      request_stripe_object(
        method: :get,
        path: resource_url + "/usage_records",
        params: params,
        opts: opts
      )
    end

    def usage_record_summaries(params = {}, opts = {})
      resp, opts = execute_resource_request(:get, resource_url + "/usage_record_summaries", params, opts)
      Util.convert_to_stripe_object(resp.data, opts)
    end
    extend Gem::Deprecate
    deprecate :usage_record_summaries, :"SubscriptionItem.list_usage_record_summaries", 2020, 1
  end
end
