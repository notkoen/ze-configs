// Credits to EasterLee#7908 & Potti#6731 for this vscript
const rad2deg = 57.295779513;
const deg2rad = 0.0174533;

moveParent <- null;
child <- null;

localOrigin <- null;
localRotation <- null;

// Enable debugging to check
DEBUG <- false;
DEBUG_Color <- Vector(255,0,0);
DEBUG_Alpha <- 100;

function OnPostSpawn() {
	moveParent = self.GetMoveParent();
	child = self;
	EntFireByHandle(child, "ClearParent", "", 0.00, null, null);
	localOrigin = child.GetOrigin() - moveParent.GetOrigin();
	localRotation = child.GetAngles();

	if (DEBUG) {
		MeasureTarget <- Entities.CreateByClassname("env_shake");
		MeasureTarget.SetOrigin(child.GetOrigin());
		MeasureTarget.SetAngles(child.GetAngles().x, child.GetAngles().y, child.GetAngles().z);
		EntFireByHandle(MeasureTarget, "SetParent", moveParent.GetName(), 0.00, null, null);
	}

	// In case moveParent started with different angles
	local inv = rotateInverse(moveParent.GetAngles());
	localOrigin = Ax(inv, localOrigin);

	local mat = [
		Ax(inv, child.GetForwardVector()),
		Ax(inv, child.GetLeftVector() * -1), // right vector * -1
		Ax(inv, child.GetUpVector())
	];

	localRotation = mat;
	// Think
	EntFireByHandle(self, "RunScriptCode" "AlignAndCheck();", 0.01, null, null);
}

function AlignAndCheck() {
	if (moveParent == null || !moveParent.IsValid()) {
		child.Destroy();
		return;
	}

	local rotate = [
		moveParent.GetForwardVector(),
		moveParent.GetLeftVector() * -1, // Right vector * -1
		moveParent.GetUpVector()
	];

	child.SetOrigin(moveParent.GetOrigin() + Ax(rotate, localOrigin));

	local newRotation = [
		Ax(rotate, localRotation[0]),
		Ax(rotate, localRotation[1]),
		Ax(rotate, localRotation[2])
	];

	newRotation = matToAngles(newRotation);
	child.SetAngles(newRotation.x, newRotation.y, newRotation.z);
	EntFireByHandle(self, "RunScriptCode" "AlignAndCheck();", 0.01, null, null);

	if (DEBUG) {
		DebugDrawBoxAngles(MeasureTarget.GetOrigin(), child.GetBoundingMins(), child.GetBoundingMaxs(), MeasureTarget.GetAngles(), DEBUG_Color.x,DEBUG_Color.y,DEBUG_Color.z, DEBUG_Alpha, 0);
	}
}

function rotateInverse(angles) {
	local rad = angles * deg2rad;
	local s2 = sin(rad.x);
	local c2 = cos(rad.x);

	local s1 = sin(rad.y);
	local c1 = cos(rad.y);

	local s3 = sin(rad.z);
	local c3 = cos(rad.z);
	return [
		Vector(c1 * c2, c1 * s2 * s3 - c3 * s1, s1 * s3 + c1 * c3 * s2), // forward
		Vector(c2 * s1, c1 * c3 + s1 * s2 * s3, c3 * s1 * s2 - c1 * s3), // left
		Vector(-s2, c2 * s3, c2 * c3) // up
	];
};

function matToAngles(mat) {
	return Vector(
		atan2(-mat[0].z, sqrt(pow(mat[0].x, 2) + pow(mat[0].y, 2))),
		atan2(mat[0].y, mat[0].x),
		atan2(mat[1].z, mat[2].z)
	) * rad2deg;
}

function Ax(a, x) {
	local nullVec = Vector(0,0,0);
	nullVec += a[0] * x.x;
	nullVec += a[1] * x.y;
	nullVec += a[2] * x.z;
	return nullVec;
};