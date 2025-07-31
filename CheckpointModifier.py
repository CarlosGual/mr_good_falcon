import torch
import os

def modify_checkpoint():
    # Path to the checkpoint
    checkpoint_path = "submission_baseline_v2/pretrained_model/RGBD_DGX_restarts.pth"

    # Check if the file exists
    if not os.path.exists(checkpoint_path):
        print(f"Error: Checkpoint file not found at {checkpoint_path}")
        return

    # Load the checkpoint
    print(f"Loading checkpoint from {checkpoint_path}")
    checkpoint = torch.load(checkpoint_path, map_location=torch.device('cpu'), weights_only=False)

    # Get the state dictionary
    if "state_dict" in checkpoint[0]:
        state_dict = checkpoint[0]["state_dict"]
    else:
        print("Error: Could not find state_dict in the checkpoint")
        return

    # Count initial keys
    initial_keys_count = len(state_dict)
    print(f"Initial number of keys in state_dict: {initial_keys_count}")

    # Find and remove all keys related to aux_loss_modules
    keys_to_remove = [k for k in state_dict.keys() if "aux_loss_modules" in k]

    # Remove those keys
    for key in keys_to_remove:
        del state_dict[key]

    # Count remaining keys
    remaining_keys_count = len(state_dict)
    print(f"Removed {initial_keys_count - remaining_keys_count} keys related to aux_loss_modules")
    print(f"Remaining keys in state_dict: {remaining_keys_count}")

    # Save the modified checkpoint back to the same location
    print(f"Saving modified checkpoint to {checkpoint_path}")
    torch.save(checkpoint, checkpoint_path)
    print("Checkpoint saved successfully!")

if __name__ == "__main__":
    modify_checkpoint()
