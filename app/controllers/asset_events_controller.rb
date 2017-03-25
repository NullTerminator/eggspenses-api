class AssetEventsController < ApplicationController
  def index
    @resources = resource_class.all
    filtered_params.each do |k, v|
      @resources = @resources.public_send(k, v) if v.present?
    end

    ensure_events

    json_response @resources
  end

  private

  def ensure_events
    asset_ids = @resources.pluck(:asset_id).uniq
    @resources = @resources.to_a
    grouped = @resources.group_by(&:asset_id)
    missing = Asset.pluck(:id) - asset_ids

    if (from_date = params[:from_date]).present?
      grouped.each do |asset_id, events|
        unless events.collect(&:date).include?(Date.parse(params[:from_date]))
          add_recent_event from_date, asset_id
        end
      end

      missing.each do |asset_id|
        add_recent_event from_date, asset_id
      end
    end

  end

  def add_recent_event(date, asset_id)
    event = AssetEvent
      .to_date(date)
      .order(date: :desc)
      .where(asset_id: asset_id)
      .first
    @resources << event if event
  end

  def asset_event_params
    params.permit(:date, :asset_id)
  end

  def filter_params
    [:from_date, :to_date]
  end
end
