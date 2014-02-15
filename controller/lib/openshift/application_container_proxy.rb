module OpenShift
  class ApplicationContainerProxy
    @proxy_provider = OpenShift::ApplicationContainerProxy

    def self.valid_gear_sizes
      @proxy_provider.valid_gear_sizes_impl
    end

    def self.valid_gear_sizes_impl
      return Rails.configuration.openshift[:gear_sizes]
    end

    def self.provider=(provider_class)
      @proxy_provider = provider_class
    end

    def self.instance(id)
      @proxy_provider.new(id)
    end

    # TODO: vladi (uhuru): modify method so it uses a platform fact, not kernel
    def self.find_available(node_profile=nil, district_uuid=nil, non_ha_server_identities=nil, kernel='Linux')
      @proxy_provider.find_available_impl(node_profile, district_uuid, non_ha_server_identities, false, nil, kernel)
    end

    # TODO: vladi (uhuru): modify method so it uses a platform fact, not kernel
    def self.find_one(node_profile=nil, kernel='Linux')
      @proxy_provider.find_one_impl(node_profile, kernel)
    end

    def self.get_blacklisted
      @proxy_provider.get_blacklisted_in_impl
    end

    def self.get_blacklisted_in_impl
      []
    end

    def self.blacklisted?(name)
      @proxy_provider.blacklisted_in_impl?(name)
    end

    def self.blacklisted_in_impl?(name)
      false
    end

    def self.get_all_gears_endpoints(opts = {})
      @proxy_provider.get_all_gears_endpoints_impl(opts)
    end

    def self.get_all_gears(opts = {})
      @proxy_provider.get_all_gears_impl(opts)
    end

    def self.get_all_active_gears
      @proxy_provider.get_all_active_gears_impl
    end

    def self.get_all_gears_sshkeys
      @proxy_provider.get_all_gears_sshkeys_impl
    end

    def self.execute_parallel_jobs(handle)
      @proxy_provider.execute_parallel_jobs_impl(handle)
    end

    def self.get_details_for_all(name_list)
      @proxy_provider.get_details_for_all_impl(name_list)
    end

    def self.set_district_uid_limits(uuid, first_uid, max_uid)
      @proxy_provider.set_district_uid_limits_impl(uuid, first_uid, max_uid) 
    end

    attr_accessor :id
  end
end
