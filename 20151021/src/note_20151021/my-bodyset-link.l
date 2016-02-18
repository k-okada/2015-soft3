;; bodyset-linkとjointを用いた多リンク系ロボットモデリング
(defclass my-bodyset-link
  :super bodyset
  :slots (joint parent-link child-links analysis-level default-coords
		weight acentroid inertia-tensor
		angular-velocity angular-acceleration
		spacial-velocity spacial-acceleration
		momentum-velocity angular-momentum-velocity
		momentum angular-momentum
		force moment ext-force ext-moment))
