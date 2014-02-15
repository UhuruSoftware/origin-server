class CreateGroupInstanceOp < PendingAppOp

  field :group_instance_id, type: String
  # TODO: vladi (uhuru): modify method so it uses a platform property, not kernel
  field :kernel, type: String

  def execute
    pending_app_op_group.application.group_instances.push(GroupInstance.new(custom_id: group_instance_id, custom_kernel: kernel))
  end
  
  def rollback
    begin
      group_instance = get_group_instance()
      group_instance.delete
    rescue Mongoid::Errors::DocumentNotFound
      # ignore if group instance is already deleted
    end
  end

end
