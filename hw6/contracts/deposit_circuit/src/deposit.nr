use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;

fn main(
    id: Field, 
    r: Field, 
    oldPath: [Field; 8], 
    oldRoot: pub Field, 
    newRoot: pub Field, 
    commitment: pub Field, 
    index: pub Field
) {
    //check commitment to make sure it is formed by id and r
    assert(commitment == pedersen_hash([id, r]));

    //check if the position we want to insert the commitment is empty
    let empty_leaf: Field = 0x2df8b940e5890e4e1377e05373fae69a1d754f6935e6a780b666947431f2cdcd;
    let compute_old_root: Field = compute_merkle_root(empty_leaf, index, oldPath);
    assert(compute_old_root==oldRoot);

    //check if the computed new root is valid
    let compute_new_root: Field = compute_merkle_root(commitment, index, oldPath);
    assert(compute_new_root==newRoot);

}
