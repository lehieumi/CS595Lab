use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;

fn main(
    r: Field,
    index: Field,
    hashpath: [Field; 8],
    root: pub Field,
    id: pub Field,
) {
    let commitment: Field= pedersen_hash([id, r]);
    let existed_root=compute_merkle_root( commitment, index, hashpath);
    assert(existed_root==root);
}
