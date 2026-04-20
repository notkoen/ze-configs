import { Instance, BaseModelEntity, CSGearSlot as CSGearSlot$1, CSInputs } from 'cs_script/point_script';

class MathUtils {
    static clamp(value, min, max) {
        return Math.min(Math.max(value, min), max);
    }
}

const RAD_TO_DEG = 180 / Math.PI;
const DEG_TO_RAD = Math.PI / 180;

class Vector3Utils {
    static equals(a, b) {
        return a.x === b.x && a.y === b.y && a.z === b.z;
    }
    static add(a, b) {
        return new Vec3(a.x + b.x, a.y + b.y, a.z + b.z);
    }
    static subtract(a, b) {
        return new Vec3(a.x - b.x, a.y - b.y, a.z - b.z);
    }
    static scale(vector, scale) {
        return new Vec3(vector.x * scale, vector.y * scale, vector.z * scale);
    }
    static multiply(a, b) {
        return new Vec3(a.x * b.x, a.y * b.y, a.z * b.z);
    }
    static divide(vector, divider) {
        if (typeof divider === 'number') {
            if (divider === 0)
                throw Error('Division by zero');
            return new Vec3(vector.x / divider, vector.y / divider, vector.z / divider);
        }
        else {
            if (divider.x === 0 || divider.y === 0 || divider.z === 0)
                throw Error('Division by zero');
            return new Vec3(vector.x / divider.x, vector.y / divider.y, vector.z / divider.z);
        }
    }
    static length(vector) {
        return Math.sqrt(Vector3Utils.lengthSquared(vector));
    }
    static lengthSquared(vector) {
        return vector.x ** 2 + vector.y ** 2 + vector.z ** 2;
    }
    static length2D(vector) {
        return Math.sqrt(Vector3Utils.length2DSquared(vector));
    }
    static length2DSquared(vector) {
        return vector.x ** 2 + vector.y ** 2;
    }
    static normalize(vector) {
        const length = Vector3Utils.length(vector);
        return length ? Vector3Utils.divide(vector, length) : Vec3.Zero;
    }
    static dot(a, b) {
        return a.x * b.x + a.y * b.y + a.z * b.z;
    }
    static cross(a, b) {
        return new Vec3(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x);
    }
    static inverse(vector) {
        return new Vec3(-vector.x, -vector.y, -vector.z);
    }
    static distance(a, b) {
        return Vector3Utils.subtract(a, b).length;
    }
    static distanceSquared(a, b) {
        return Vector3Utils.subtract(a, b).lengthSquared;
    }
    static distance2D(a, b) {
        return new Vec3(a.x - b.x, a.y - b.y, 0).length;
    }
    static distance2DSquared(a, b) {
        return new Vec3(a.x - b.x, a.y - b.y, 0).lengthSquared;
    }
    static floor(vector) {
        return new Vec3(Math.floor(vector.x), Math.floor(vector.y), Math.floor(vector.z));
    }
    static vectorAngles(vector) {
        let yaw = 0;
        let pitch = 0;
        if (!vector.y && !vector.x) {
            if (vector.z > 0)
                pitch = -90;
            else
                pitch = 90;
        }
        else {
            yaw = Math.atan2(vector.y, vector.x) * RAD_TO_DEG;
            pitch = Math.atan2(-vector.z, Vector3Utils.length2D(vector)) * RAD_TO_DEG;
        }
        return new Euler({
            pitch,
            yaw,
            roll: 0,
        });
    }
    static lerp(a, b, fraction, clamp = true) {
        let t = fraction;
        if (clamp) {
            t = MathUtils.clamp(t, 0, 1);
        }
        // a + (b - a) * t
        return new Vec3(a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t, a.z + (b.z - a.z) * t);
    }
    static directionTowards(a, b) {
        return Vector3Utils.subtract(b, a).normal;
    }
    static lookAt(a, b) {
        return Vector3Utils.directionTowards(a, b).eulerAngles;
    }
    static withX(vector, x) {
        return new Vec3(x, vector.y, vector.z);
    }
    static withY(vector, y) {
        return new Vec3(vector.x, y, vector.z);
    }
    static withZ(vector, z) {
        return new Vec3(vector.x, vector.y, z);
    }
    static round(vector) {
        return new Vec3(Math.round(vector.x), Math.round(vector.y), Math.round(vector.z));
    }
    static ceil(vector) {
        return new Vec3(Math.ceil(vector.x), Math.ceil(vector.y), Math.ceil(vector.z));
    }
    static map(vector, callback) {
        return new Vec3(callback(vector.x), callback(vector.y), callback(vector.z));
    }
}
class Vec3 {
    x;
    y;
    z;
    static get Zero() {
        return new Vec3(0, 0, 0);
    }
    static get Forward() {
        return new Vec3(1, 0, 0);
    }
    static get Right() {
        return new Vec3(0, 1, 0);
    }
    static get Up() {
        return new Vec3(0, 0, 1);
    }
    constructor(xOrVector, y, z) {
        if (typeof xOrVector === 'object') {
            this.x = xOrVector.x === 0 ? 0 : xOrVector.x;
            this.y = xOrVector.y === 0 ? 0 : xOrVector.y;
            this.z = xOrVector.z === 0 ? 0 : xOrVector.z;
        }
        else {
            this.x = xOrVector === 0 ? 0 : xOrVector;
            this.y = y === 0 ? 0 : y;
            this.z = z === 0 ? 0 : z;
        }
    }
    get length() {
        return Vector3Utils.length(this);
    }
    get lengthSquared() {
        return Vector3Utils.lengthSquared(this);
    }
    get length2D() {
        return Vector3Utils.length2D(this);
    }
    get length2DSquared() {
        return Vector3Utils.length2DSquared(this);
    }
    /**
     * Normalizes the vector (Dividing the vector by its length to have the length be equal to 1 e.g. [0.0, 0.666, 0.333])
     */
    get normal() {
        return Vector3Utils.normalize(this);
    }
    get inverse() {
        return Vector3Utils.inverse(this);
    }
    /**
     * Floor (Round down) each vector component
     */
    get floored() {
        return Vector3Utils.floor(this);
    }
    /**
     * Ceil (Round up) each vector component
     */
    get ceil() {
        return Vector3Utils.ceil(this);
    }
    /**
     * Rounds each vector component
     */
    get round() {
        return Vector3Utils.round(this);
    }
    /**
     * Calculates the angles from a forward vector
     */
    get eulerAngles() {
        return Vector3Utils.vectorAngles(this);
    }
    toString() {
        return `Vec3: [${this.x}, ${this.y}, ${this.z}]`;
    }
    equals(vector) {
        return Vector3Utils.equals(this, vector);
    }
    add(vector) {
        return Vector3Utils.add(this, vector);
    }
    subtract(vector) {
        return Vector3Utils.subtract(this, vector);
    }
    divide(vector) {
        return Vector3Utils.divide(this, vector);
    }
    scale(scaleOrVector) {
        return typeof scaleOrVector === 'number'
            ? Vector3Utils.scale(this, scaleOrVector)
            : Vector3Utils.multiply(this, scaleOrVector);
    }
    multiply(scaleOrVector) {
        return typeof scaleOrVector === 'number'
            ? Vector3Utils.scale(this, scaleOrVector)
            : Vector3Utils.multiply(this, scaleOrVector);
    }
    dot(vector) {
        return Vector3Utils.dot(this, vector);
    }
    cross(vector) {
        return Vector3Utils.cross(this, vector);
    }
    distance(vector) {
        return Vector3Utils.distance(this, vector);
    }
    distance2D(vector) {
        return Vector3Utils.distance2D(this, vector);
    }
    distanceSquared(vector) {
        return Vector3Utils.distanceSquared(this, vector);
    }
    distance2DSquared(vector) {
        return Vector3Utils.distance2DSquared(this, vector);
    }
    /**
     * Linearly interpolates the vector to a point based on a 0.0-1.0 fraction
     * Clamp limits the fraction to [0,1]
     */
    lerpTo(vector, fraction, clamp = true) {
        return Vector3Utils.lerp(this, vector, fraction, clamp);
    }
    /**
     * Gets the normalized direction vector pointing towards specified point (subtracting two vectors)
     */
    directionTowards(vector) {
        return Vector3Utils.directionTowards(this, vector);
    }
    /**
     * Returns an angle pointing towards a point from the current vector
     */
    lookAt(vector) {
        return Vector3Utils.lookAt(this, vector);
    }
    /**
     * Returns the same vector but with a supplied X component
     */
    withX(x) {
        return Vector3Utils.withX(this, x);
    }
    /**
     * Returns the same vector but with a supplied Y component
     */
    withY(y) {
        return Vector3Utils.withY(this, y);
    }
    /**
     * Returns the same vector but with a supplied Z component
     */
    withZ(z) {
        return Vector3Utils.withZ(this, z);
    }
}

class EulerUtils {
    static equals(a, b) {
        return a.pitch === b.pitch && a.yaw === b.yaw && a.roll === b.roll;
    }
    static normalize(angle) {
        const normalizeAngle = (angle) => {
            angle = angle % 360;
            if (angle > 180)
                return angle - 360;
            if (angle < -180)
                return angle + 360;
            return angle;
        };
        return new Euler(normalizeAngle(angle.pitch), normalizeAngle(angle.yaw), normalizeAngle(angle.roll));
    }
    static forward(angle) {
        const pitchInRad = (angle.pitch / 180) * Math.PI;
        const yawInRad = (angle.yaw / 180) * Math.PI;
        const cosPitch = Math.cos(pitchInRad);
        return new Vec3(cosPitch * Math.cos(yawInRad), cosPitch * Math.sin(yawInRad), -Math.sin(pitchInRad));
    }
    static right(angle) {
        const pitchInRad = (angle.pitch / 180) * Math.PI;
        const yawInRad = (angle.yaw / 180) * Math.PI;
        const rollInRad = (angle.roll / 180) * Math.PI;
        const sinPitch = Math.sin(pitchInRad);
        const sinYaw = Math.sin(yawInRad);
        const sinRoll = Math.sin(rollInRad);
        const cosPitch = Math.cos(pitchInRad);
        const cosYaw = Math.cos(yawInRad);
        const cosRoll = Math.cos(rollInRad);
        return new Vec3(-1 * sinRoll * sinPitch * cosYaw + -1 * cosRoll * -sinYaw, -1 * sinRoll * sinPitch * sinYaw + -1 * cosRoll * cosYaw, -1 * sinRoll * cosPitch);
    }
    static up(angle) {
        const pitchInRad = (angle.pitch / 180) * Math.PI;
        const yawInRad = (angle.yaw / 180) * Math.PI;
        const rollInRad = (angle.roll / 180) * Math.PI;
        const sinPitch = Math.sin(pitchInRad);
        const sinYaw = Math.sin(yawInRad);
        const sinRoll = Math.sin(rollInRad);
        const cosPitch = Math.cos(pitchInRad);
        const cosYaw = Math.cos(yawInRad);
        const cosRoll = Math.cos(rollInRad);
        return new Vec3(cosRoll * sinPitch * cosYaw + -sinRoll * -sinYaw, cosRoll * sinPitch * sinYaw + -sinRoll * cosYaw, cosRoll * cosPitch);
    }
    static lerp(a, b, fraction, clamp = true) {
        let t = fraction;
        if (clamp) {
            t = MathUtils.clamp(t, 0, 1);
        }
        const lerpComponent = (start, end, t) => {
            // Calculate the shortest angular distance
            let delta = end - start;
            // Normalize delta to [-180, 180] range to find shortest path
            if (delta > 180) {
                delta -= 360;
            }
            else if (delta < -180) {
                delta += 360;
            }
            // Interpolate using the shortest path
            return start + delta * t;
        };
        // a + (b - a) * t
        return new Euler(lerpComponent(a.pitch, b.pitch, t), lerpComponent(a.yaw, b.yaw, t), lerpComponent(a.roll, b.roll, t));
    }
    static withPitch(angle, pitch) {
        return new Euler(pitch, angle.yaw, angle.roll);
    }
    static withYaw(angle, yaw) {
        return new Euler(angle.pitch, yaw, angle.roll);
    }
    static withRoll(angle, roll) {
        return new Euler(angle.pitch, angle.yaw, roll);
    }
    static rotateTowards(current, target, maxStep) {
        const rotateComponent = (current, target, step) => {
            let delta = target - current;
            if (delta > 180) {
                delta -= 360;
            }
            else if (delta < -180) {
                delta += 360;
            }
            if (Math.abs(delta) <= step) {
                return target;
            }
            else {
                return current + Math.sign(delta) * step;
            }
        };
        return new Euler(rotateComponent(current.pitch, target.pitch, maxStep), rotateComponent(current.yaw, target.yaw, maxStep), rotateComponent(current.roll, target.roll, maxStep));
    }
    static clamp(angle, min, max) {
        return new Euler(MathUtils.clamp(angle.pitch, min.pitch, max.pitch), MathUtils.clamp(angle.yaw, min.yaw, max.yaw), MathUtils.clamp(angle.roll, min.roll, max.roll));
    }
    static round(angle) {
        return new Euler(Math.round(angle.pitch), Math.round(angle.yaw), Math.round(angle.roll));
    }
    static floor(angle) {
        return new Euler(Math.floor(angle.pitch), Math.floor(angle.yaw), Math.floor(angle.roll));
    }
    static ceil(angle) {
        return new Euler(Math.ceil(angle.pitch), Math.ceil(angle.yaw), Math.ceil(angle.roll));
    }
}
class Euler {
    pitch;
    yaw;
    roll;
    static Zero = new Euler(0, 0, 0);
    static Forward = new Euler(1, 0, 0);
    static Right = new Euler(0, 1, 0);
    static Up = new Euler(0, 0, 1);
    constructor(pitchOrAngle, yaw, roll) {
        if (typeof pitchOrAngle === 'object') {
            this.pitch = pitchOrAngle.pitch === 0 ? 0 : pitchOrAngle.pitch;
            this.yaw = pitchOrAngle.yaw === 0 ? 0 : pitchOrAngle.yaw;
            this.roll = pitchOrAngle.roll === 0 ? 0 : pitchOrAngle.roll;
        }
        else {
            this.pitch = pitchOrAngle === 0 ? pitchOrAngle : pitchOrAngle;
            this.yaw = yaw === 0 ? 0 : yaw;
            this.roll = roll === 0 ? 0 : roll;
        }
    }
    /**
     * Returns angle with every componented clamped from -180 to 180
     */
    get normal() {
        return EulerUtils.normalize(this);
    }
    /**
     * Returns a normalized forward direction vector
     */
    get forward() {
        return EulerUtils.forward(this);
    }
    /**
     * Returns a normalized backward direction vector
     */
    get backward() {
        return this.forward.inverse;
    }
    /**
     * Returns a normalized right direction vector
     */
    get right() {
        return EulerUtils.right(this);
    }
    /**
     * Returns a normalized left direction vector
     */
    get left() {
        return this.right.inverse;
    }
    /**
     * Returns a normalized up direction vector
     */
    get up() {
        return EulerUtils.up(this);
    }
    /**
     * Returns a normalized down direction vector
     */
    get down() {
        return this.up.inverse;
    }
    /**
     * Floor (Round down) each vector component
     */
    get floor() {
        return EulerUtils.floor(this);
    }
    /**
     * Ceil (Round up) each vector component
     */
    get ceil() {
        return EulerUtils.ceil(this);
    }
    /**
     * Rounds each vector component
     */
    get round() {
        return EulerUtils.round(this);
    }
    toString() {
        return `Euler: [${this.pitch}, ${this.yaw}, ${this.roll}]`;
    }
    equals(angle) {
        return EulerUtils.equals(this, angle);
    }
    /**
     * Linearly interpolates the angle to an angle based on a 0.0-1.0 fraction
     * Clamp limits the fraction to [0,1]
     * ! Euler angles are not suited for interpolation, prefer to use quarternions instead
     */
    lerp(angle, fraction, clamp = true) {
        return EulerUtils.lerp(this, angle, fraction, clamp);
    }
    /**
     * Returns the same angle but with a supplied pitch component
     */
    withPitch(pitch) {
        return EulerUtils.withPitch(this, pitch);
    }
    /**
     * Returns the same angle but with a supplied yaw component
     */
    withYaw(yaw) {
        return EulerUtils.withYaw(this, yaw);
    }
    /**
     * Returns the same angle but with a supplied roll component
     */
    withRoll(roll) {
        return EulerUtils.withRoll(this, roll);
    }
    /**
     * Rotates an angle towards another angle by a specific step
     * ! Euler angles are not suited for interpolation, prefer to use quarternions instead
     */
    rotateTowards(angle, maxStep) {
        return EulerUtils.rotateTowards(this, angle, maxStep);
    }
    /**
     * Clamps each component (pitch, yaw, roll) between the corresponding min and max values
     */
    clamp(min, max) {
        return EulerUtils.clamp(this, min, max);
    }
}

class Matrix3x4 {
    // no need for constructor as the array is initialised to 0 by default
    m = new Float32Array(12);
    // using a single dimensional array for performance, the matrix indices look like this
    // so column index 3, row index 2 would be array index 11.
    //      0  1  2  3
    //
    //  0   0  1  2  3
    //  1   4  5  6  7
    //  2   8  9  10 11
    // set to identity
    constructor() {
        this.m.fill(0);
        this.m[0] = 1;
        this.m[5] = 1;
        this.m[10] = 1;
    }
    equals(mat2, tolerance = 1e-5) {
        for (let i = 0; i < 12; ++i) {
            if (Math.abs(this.m[i] - mat2.m[i]) > tolerance)
                return false;
        }
        return true;
    }
    get isIdentity() {
        return this.equals(Matrix3x4.identityMatrix);
    }
    get isValid() {
        if (!this.isOrthogonal) {
            return false;
        }
        for (let i = 0; i < 12; i++) {
            if (!Number.isFinite(this.m[i]))
                return false;
        }
        return true;
    }
    // multiplying an orthogonal matrix with its transpose should always give us the identity matrix.
    get isOrthogonal() {
        return this.multiply(this.inverse).isIdentity;
    }
    /**
     * Inverts the matrix. Actually a transpose but as long as our matrix stays orthogonal it should be the same.
     */
    get inverse() {
        const retMat = new Matrix3x4();
        // transpose the matrix
        retMat.m[0] = this.m[0];
        retMat.m[1] = this.m[4];
        retMat.m[2] = this.m[8];
        retMat.m[4] = this.m[1];
        retMat.m[5] = this.m[5];
        retMat.m[6] = this.m[9];
        retMat.m[8] = this.m[2];
        retMat.m[9] = this.m[6];
        retMat.m[10] = this.m[10];
        // convert translation to new space
        const x = this.m[3];
        const y = this.m[7];
        const z = this.m[11];
        retMat.m[3] = -(x * retMat.m[0] + y * retMat.m[1] + z * retMat.m[2]);
        retMat.m[7] = -(x * retMat.m[4] + y * retMat.m[5] + z * retMat.m[6]);
        retMat.m[11] = -(x * retMat.m[8] + y * retMat.m[9] + z * retMat.m[10]);
        return retMat;
    }
    setOrigin(x, y, z) {
        this.m[3] = x;
        this.m[7] = y;
        this.m[11] = z;
    }
    get origin() {
        return new Vec3(this.m[3], this.m[7], this.m[11]);
    }
    set origin({ x, y, z }) {
        this.setOrigin(x, y, z);
    }
    setAngles(pitch, yaw, roll) {
        const ay = DEG_TO_RAD * yaw;
        const ax = DEG_TO_RAD * pitch;
        const az = DEG_TO_RAD * roll;
        const sy = Math.sin(ay), cy = Math.cos(ay);
        const sp = Math.sin(ax), cp = Math.cos(ax);
        const sr = Math.sin(az), cr = Math.cos(az);
        this.m[0] = cp * cy;
        this.m[4] = cp * sy;
        this.m[8] = -sp;
        this.m[1] = sr * sp * cy + cr * -sy;
        this.m[5] = sr * sp * sy + cr * cy;
        this.m[9] = sr * cp;
        this.m[2] = cr * sp * cy + -sr * -sy;
        this.m[6] = cr * sp * sy + -sr * cy;
        this.m[10] = cr * cp;
    }
    set angles(angles) {
        this.setAngles(angles.pitch, angles.yaw, angles.roll);
    }
    get angles() {
        const returnAngles = new Euler(0, 0, 0);
        const forward0 = this.m[0];
        const forward1 = this.m[4];
        const xyDist = Math.sqrt(forward0 * forward0 + forward1 * forward1);
        if (xyDist > 0.001) {
            returnAngles.yaw = Math.atan2(forward1, forward0) * RAD_TO_DEG;
            returnAngles.pitch = Math.atan2(-this.m[8], xyDist) * RAD_TO_DEG;
            returnAngles.roll = Math.atan2(this.m[9], this.m[10]) * RAD_TO_DEG;
        } // gimbal lock
        else {
            returnAngles.yaw = Math.atan2(-this.m[1], this.m[5]) * RAD_TO_DEG;
            returnAngles.pitch = Math.atan2(-this.m[8], xyDist) * RAD_TO_DEG;
            returnAngles.roll = 0.0;
        }
        return returnAngles;
    }
    get forward() {
        return new Vec3(this.m[0], this.m[4], this.m[8]);
    }
    set forward(vec) {
        // normalise because users can not be trusted
        const fwd = vec.normal;
        let right;
        if (Math.abs(fwd.dot(Vec3.Up)) > 0.999) {
            // forward is nearly the same as up/down, use world forward instead to avoid divide by zero
            right = fwd.cross(Vec3.Forward).normal;
        }
        else {
            // this makes the right vector always perpendicular to world up vector, it makes the orientation of everything more stable.
            right = Vec3.Up.cross(fwd).normal;
        }
        const up = fwd.cross(right).normal;
        this.m[0] = fwd.x;
        this.m[4] = fwd.y;
        this.m[8] = fwd.z;
        this.m[1] = right.x;
        this.m[5] = right.y;
        this.m[9] = right.z;
        this.m[2] = up.x;
        this.m[6] = up.y;
        this.m[10] = up.z;
    }
    get backward() {
        return new Vec3(-this.m[0], -this.m[4], -this.m[8]);
    }
    set backward(vec) {
        this.forward = vec.inverse;
    }
    get right() {
        return new Vec3(-this.m[1], -this.m[5], -this.m[9]);
    }
    set right(vec) {
        // normalise because users can not be trusted
        const right = vec.normal;
        let fwd;
        if (Math.abs(right.dot(Vec3.Up)) > 0.999) {
            // right is nearly the same as up/down, use world forward instead to avoid divide by zero
            fwd = Vec3.Forward.cross(right).normal;
        }
        else {
            // this makes the forward vector always perpendicular to world up vector, it makes the orientation of everything more stable.
            fwd = right.cross(Vec3.Up).normal;
        }
        const up = fwd.cross(right).normal;
        this.m[0] = fwd.x;
        this.m[4] = fwd.y;
        this.m[8] = fwd.z;
        this.m[1] = right.x;
        this.m[5] = right.y;
        this.m[9] = right.z;
        this.m[2] = up.x;
        this.m[6] = up.y;
        this.m[10] = up.z;
    }
    get left() {
        return this.right.inverse;
    }
    set left(vec) {
        this.right = vec.inverse;
    }
    get up() {
        return new Vec3(this.m[2], this.m[6], this.m[10]);
    }
    set up(vec) {
        // normalise because users can not be trusted
        const up = vec.normal;
        let right;
        if (Math.abs(up.dot(Vec3.Forward)) > 0.999) {
            right = Vec3.Right.cross(up).normal;
        }
        else {
            right = up.cross(Vec3.Forward).normal;
        }
        const fwd = right.cross(up).normal;
        this.m[0] = fwd.x;
        this.m[4] = fwd.y;
        this.m[8] = fwd.z;
        this.m[1] = right.x;
        this.m[5] = right.y;
        this.m[9] = right.z;
        this.m[2] = up.x;
        this.m[6] = up.y;
        this.m[10] = up.z;
    }
    get down() {
        return new Vec3(-this.m[2], -this.m[6], -this.m[10]);
    }
    set down(vec) {
        this.up = vec.inverse;
    }
    multiply(mat2) {
        const out = new Matrix3x4();
        const m1 = this.m;
        const m2 = mat2.m;
        const m3 = out.m;
        m3[0] = m1[0] * m2[0] + m1[1] * m2[4] + m1[2] * m2[8];
        m3[1] = m1[0] * m2[1] + m1[1] * m2[5] + m1[2] * m2[9];
        m3[2] = m1[0] * m2[2] + m1[1] * m2[6] + m1[2] * m2[10];
        m3[3] = m1[0] * m2[3] + m1[1] * m2[7] + m1[2] * m2[11] + m1[3];
        m3[4] = m1[4] * m2[0] + m1[5] * m2[4] + m1[6] * m2[8];
        m3[5] = m1[4] * m2[1] + m1[5] * m2[5] + m1[6] * m2[9];
        m3[6] = m1[4] * m2[2] + m1[5] * m2[6] + m1[6] * m2[10];
        m3[7] = m1[4] * m2[3] + m1[5] * m2[7] + m1[6] * m2[11] + m1[7];
        m3[8] = m1[8] * m2[0] + m1[9] * m2[4] + m1[10] * m2[8];
        m3[9] = m1[8] * m2[1] + m1[9] * m2[5] + m1[10] * m2[9];
        m3[10] = m1[8] * m2[2] + m1[9] * m2[6] + m1[10] * m2[10];
        m3[11] = m1[8] * m2[3] + m1[9] * m2[7] + m1[10] * m2[11] + m1[11];
        return out;
    }
    // assume this matrix is a pure rotation matrix, and rotate vec
    rotateVec3(vec) {
        // dot product input vec with the rotation part of the matrix
        return new Vec3(vec.x * this.m[0] + vec.y * this.m[1] + vec.z * this.m[2], vec.x * this.m[4] + vec.y * this.m[5] + vec.z * this.m[6], vec.x * this.m[8] + vec.y * this.m[9] + vec.z * this.m[10]);
    }
    // almost the same as the rotate function, but it then adds on the translation part
    // copy pasted for performance
    transformVec3(vec) {
        return new Vec3(vec.x * this.m[0] + vec.y * this.m[1] + vec.z * this.m[2] + this.m[3], vec.x * this.m[4] + vec.y * this.m[5] + vec.z * this.m[6] + this.m[7], vec.x * this.m[8] + vec.y * this.m[9] + vec.z * this.m[10] + this.m[11]);
    }
    /**
     * Rotates by the inverse of the matrix.
     */
    rotateInverseVec3(vec) {
        return new Vec3(vec.x * this.m[0] + vec.y * this.m[4] + vec.z * this.m[8], vec.x * this.m[1] + vec.y * this.m[5] + vec.z * this.m[9], vec.x * this.m[2] + vec.y * this.m[6] + vec.z * this.m[10]);
    }
    /**
     * Transform vec by the transpose of the matrix, assuming the matrix is orthogonal this is also the inverse.
     */
    transformInverseVec3(vec) {
        const vecMy = vec.x - this.m[3];
        const vecMx = vec.y - this.m[7];
        const vecMz = vec.z - this.m[11];
        return new Vec3(vecMy * this.m[0] + vecMx * this.m[4] + vecMz * this.m[8], vecMy * this.m[1] + vecMx * this.m[5] + vecMz * this.m[9], vecMy * this.m[2] + vecMx * this.m[6] + vecMz * this.m[10]);
    }
    toString() {
        return `\n           [${this.m[0]}, ${this.m[1]}, ${this.m[2]}, ${this.m[3]}]
                \nMatrix3_4: [${this.m[4]}, ${this.m[5]}, ${this.m[6]}, ${this.m[7]}]
                \n           [${this.m[8]}, ${this.m[9]}, ${this.m[10]}, ${this.m[11]}]`;
    }
    toArray() {
        return this.m;
    }
    static getScaleMatrix(x, y, z) {
        const matrix = new Matrix3x4();
        matrix.m[0] = x;
        matrix.m[5] = y;
        matrix.m[10] = z;
        return matrix;
    }
    static identityMatrix = Object.freeze(new Matrix3x4());
}

let idPool = 0;
let tasks = [];
function setTimeout(callback, ms) {
    const id = idPool++;
    tasks.unshift({
        id,
        atSeconds: Instance.GetGameTime() + ms / 1000,
        callback,
    });
    return id;
}
function setInterval(callback, ms) {
    const id = idPool++;
    tasks.unshift({
        id,
        everyNSeconds: ms / 1000,
        atSeconds: Instance.GetGameTime() + ms / 1000,
        callback,
    });
    return id;
}
function delay(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}
function clearTimeout(id) {
    tasks = tasks.filter((task) => task.id !== id);
}
const clearInterval = clearTimeout;
function clearTasks() {
    tasks = [];
}
function runSchedulerTick() {
    for (let i = tasks.length - 1; i >= 0; i--) {
        const task = tasks[i];
        if (Instance.GetGameTime() < task.atSeconds)
            continue;
        if (task.everyNSeconds === undefined)
            tasks.splice(i, 1);
        else
            task.atSeconds = Instance.GetGameTime() + task.everyNSeconds;
        try {
            task.callback();
        }
        catch (err) {
            Instance.Msg('An error occurred inside a scheduler task');
            if (err instanceof Error) {
                Instance.Msg(err.message);
                Instance.Msg(err.stack ?? '<no stack>');
            }
        }
    }
}

var Team;
(function (Team) {
    Team[Team["UNASSIGNED"] = 0] = "UNASSIGNED";
    Team[Team["SPECTATOR"] = 1] = "SPECTATOR";
    Team[Team["T"] = 2] = "T";
    Team[Team["CT"] = 3] = "CT";
})(Team || (Team = {}));
/**
 * @deprecated cs_script/point_script now exports this enum, use that instead
 */
var CSWeaponType;
(function (CSWeaponType) {
    CSWeaponType[CSWeaponType["KNIFE"] = 0] = "KNIFE";
    CSWeaponType[CSWeaponType["PISTOL"] = 1] = "PISTOL";
    CSWeaponType[CSWeaponType["SUBMACHINEGUN"] = 2] = "SUBMACHINEGUN";
    CSWeaponType[CSWeaponType["RIFLE"] = 3] = "RIFLE";
    CSWeaponType[CSWeaponType["SHOTGUN"] = 4] = "SHOTGUN";
    CSWeaponType[CSWeaponType["SNIPER_RIFLE"] = 5] = "SNIPER_RIFLE";
    CSWeaponType[CSWeaponType["MACHINEGUN"] = 6] = "MACHINEGUN";
    CSWeaponType[CSWeaponType["C4"] = 7] = "C4";
    CSWeaponType[CSWeaponType["TASER"] = 8] = "TASER";
    CSWeaponType[CSWeaponType["GRENADE"] = 9] = "GRENADE";
    CSWeaponType[CSWeaponType["EQUIPMENT"] = 10] = "EQUIPMENT";
    CSWeaponType[CSWeaponType["STACKABLEITEM"] = 11] = "STACKABLEITEM";
    CSWeaponType[CSWeaponType["UNKNOWN"] = 12] = "UNKNOWN";
})(CSWeaponType || (CSWeaponType = {}));
/**
 * @deprecated cs_script/point_script now exports this enum, use that instead
 */
var CSGearSlot;
(function (CSGearSlot) {
    CSGearSlot[CSGearSlot["INVALID"] = -1] = "INVALID";
    CSGearSlot[CSGearSlot["RIFLE"] = 0] = "RIFLE";
    CSGearSlot[CSGearSlot["PISTOL"] = 1] = "PISTOL";
    CSGearSlot[CSGearSlot["KNIFE"] = 2] = "KNIFE";
    CSGearSlot[CSGearSlot["GRENADES"] = 3] = "GRENADES";
    CSGearSlot[CSGearSlot["C4"] = 4] = "C4";
})(CSGearSlot || (CSGearSlot = {}));

// MAP MANAGER \\
const script_cosmo = "script_cosmo";
let levelcounter = 1;
let warmup = false;
Instance.OnScriptInput("StageWon", () => {
    if (levelcounter < 6) {
        levelcounter++;
    }
});
Instance.OnScriptInput("StageWarmup", () => {
    levelcounter = 1;
});
Instance.OnScriptInput("StageNormal", () => {
    levelcounter = 2;
});
Instance.OnScriptInput("StageHard", () => {
    levelcounter = 3;
});
Instance.OnScriptInput("StageExtreme", () => {
    levelcounter = 4;
});
Instance.OnScriptInput("StageRage", () => {
    levelcounter = 5;
});
Instance.OnScriptInput("StageZM", () => {
    levelcounter = 6;
});
Instance.OnRoundStart(() => {
    warmup = false;
    human_items = [];
    zombie_items = [];
    gi_nattak_silence = false;
    shinra_elevator = false;
    shinra_tp = false;
    zm_immunity = false;
    minion_origin_temp = [...minion_origin];
    minion_2_origin_temp = [...minion_2_origin];
    boss_health = 1;
    genesis = null;
    genesis_stop = false;
    item_heal_immunity_players = [];
    trigger_hurt_immunity_players = [];
    grenade_given = [];
    vip_players = [];
    EntFire("Levels_Case", "InValue", levelcounter, 0.04);
    sleep_wind_origin_temp = [...sleep_wind_origin];
    zm_fire_ice_origin_temp = [...zm_fire_ice_origin];
    if (levelcounter !== 5) {
        killShinra();
        item_origin_temp = [...item_origin];
    }
    else {
        item_origin_temp = [...item_rage_origin];
        sleep_wind_origin_temp = sleep_wind_origin_temp.filter(o => o.origin.x !== -5188 || o.origin.y !== -1476 || o.origin.z !== 1992);
    }
    if (levelcounter !== 2) {
        EntFire("RedX*", "Kill");
        EntFire("stage1_end_move", "Kill");
    }
    if (levelcounter === 1 || levelcounter >= 5) {
        killGi();
    }
    if (yek_enable) {
        EntFire("Ultima_Killer", "Kill");
    }
    if (levelcounter === 1) {
        warmup = true;
    }
});
function killGi() {
    const gi_ents = Instance.FindEntitiesByName("gi*");
    for (const e of gi_ents) {
        if (e.GetClassName() !== "func_brush") {
            e.Remove();
        }
    }
}
function killShinra() {
    const shinra_ents = Instance.FindEntitiesByName("shinra*");
    for (const e of shinra_ents) {
        if (e.GetClassName() !== "func_brush" && !(e.GetEntityName().includes("3Dsky"))) {
            e.Remove();
        }
    }
}
Instance.OnScriptInput("SpawnTP", (data) => {
    const dest = Instance.FindEntitiesByName("spawn_tp_dest");
    const activator = data.activator;
    activator.Teleport({ position: dest[getRandomInt(0, dest.length - 1)].GetAbsOrigin() });
    EntFireTarget(activator, "Alpha", 255);
    activator.SetEntityName("player");
    EntFire("steamid_filter", "TestActivator", "", 1, activator);
});
let vip_players = [];
Instance.OnScriptInput("GiveSkin", (data) => {
    const activator = data.activator;
    if (activator.GetTeamNumber() !== Team.CT) {
        return;
    }
    if (activator instanceof BaseModelEntity) {
        if (!vip_players.includes(activator)) {
            activator.default_skin = activator.GetModelName();
            vip_players.push(activator);
        }
        activator.SetModel("models/tifa/tifa.vmdl");
    }
});
Instance.OnScriptInput("RemoveSkin", (data) => {
    const activator = data.activator;
    for (const p of vip_players) {
        if (activator === p) {
            if (activator instanceof BaseModelEntity) {
                activator.SetModel(p.default_skin);
            }
            return;
        }
    }
});
// ITEM HANDLING \\
const item_tickrate = 0.02;
let human_items = [];
let zombie_items = [];
let gi_nattak_silence = false;
let shinra_elevator = false;
let shinra_tp = false;
let yek_enable = false;
Instance.OnScriptInput("GiNattakSilence", () => {
    gi_nattak_silence = true;
    setTimeout(() => {
        gi_nattak_silence = false;
    }, 15 * 1000);
});
Instance.OnScriptInput("ShinraElevator", () => {
    shinra_elevator = true;
    setTimeout(() => {
        shinra_elevator = false;
    }, 28 * 1000);
});
Instance.OnScriptInput("ShinraTP", () => {
    shinra_tp = true;
    setTimeout(() => {
        shinra_tp = false;
    }, 25 * 1000);
});
Instance.OnScriptInput("YekEnable", () => {
    yek_enable = true;
});
Instance.OnScriptInput("ItemTick", () => {
    for (const item of human_items) {
        if (!item.IsValid() || !item.player.IsValid() || item.player.GetTeamNumber() !== Team.CT || item.player.GetHealth() <= 0 || item.player.FindWeaponBySlot(CSGearSlot$1.PISTOL)?.GetClassName() !== "weapon_elite") {
            human_items = removeItem(item, human_items);
            continue;
        }
        if (item.player.WasInputJustPressed(CSInputs.USE)) {
            if (item.GetEntityName() === "Item_Relay_Ultima" && shinra_tp) {
                continue;
            }
            if (!gi_nattak_silence)
                EntFireTarget(item, "Trigger");
        }
    }
    for (const item of zombie_items) {
        if (!item.IsValid() || !item.player.IsValid() || item.player.GetTeamNumber() !== Team.T || item.player.GetHealth() <= 0 || item.player.FindWeaponBySlot(CSGearSlot$1.KNIFE) === undefined) {
            zombie_items = removeItem(item, zombie_items);
            continue;
        }
        if (item.player.WasInputJustPressed(CSInputs.USE)) {
            if (item.GetEntityName() === "Item_Z_Ice_Relay" && shinra_elevator) {
                continue;
            }
            EntFireTarget(item, "Trigger");
        }
        if (item.GetEntityName() === "Item_Z_Ice_Relay" || item.GetEntityName() === "Item_Z_Fire_Relay") {
            if (item.speed_timeout > 20) {
                EntFireTarget(item.player, "keyvalue", "runspeed 1.2");
                item.speed_timeout = 0;
            }
            item.speed_timeout += item_tickrate;
        }
    }
});
Instance.OnScriptInput("SetItemHuman", (data) => {
    const relay = data.caller;
    // Remove duplicates
    human_items = removeItem(relay, human_items);
    relay.player = data.activator;
    human_items.push(relay);
});
Instance.OnScriptInput("RemoveItemHuman", (data) => {
    human_items = removeItem(data.caller, human_items);
});
Instance.OnScriptInput("SetItemZombie", (data) => {
    const relay = data.caller;
    // Remove duplicates
    zombie_items = removeItem(relay, zombie_items);
    relay.player = data.activator;
    relay.speed_timeout = 21;
    zombie_items.push(relay);
});
Instance.OnScriptInput("RemoveItemZombie", (data) => {
    zombie_items = removeItem(data.caller, zombie_items);
});
Instance.OnScriptInput("SetOwner", (data) => {
    data.activator.SetOwner(data.caller);
});
Instance.OnScriptInput("ResetOwner", (data) => {
    data.activator.SetOwner(undefined);
});
Instance.OnScriptInput("SetZMHealth", (data) => {
    data.activator.SetHealth(35000);
});
class Origin {
    origin;
    angle;
    constructor(origin, angle) {
        this.origin = origin;
        this.angle = angle;
    }
}
const item_origin = [
    new Origin(new Vec3(-214, -1198, 619), new Euler(0, 0, 0)),
    new Origin(new Vec3(2313, -1421, 286), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1355, -4511, 1194), new Euler(0, 0, 0)),
    new Origin(new Vec3(-2430, -3206, 1066), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1476, -2570, 1149), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1995, -1654, 1219), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1671, -1338, 1641), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1765, -554, 1339), new Euler(0, 270, 0)),
    new Origin(new Vec3(-2414, -3639, 1391), new Euler(0, 0, 0)),
    new Origin(new Vec3(-2610, -958, 1600), new Euler(0, 270, 0)),
    new Origin(new Vec3(-2207, -3605, 1878), new Euler(0, 0, 0)),
    new Origin(new Vec3(-6450, -193, 2126), new Euler(0, 0, 0)),
    new Origin(new Vec3(-5570, -695, 1871), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1218, 312, 305), new Euler(0, 0, 0)),
    new Origin(new Vec3(-7280, -2871, 2013), new Euler(0, 0, 0)),
    new Origin(new Vec3(-4710, -911, 1870), new Euler(0, 0, 0)),
];
const item_rage_origin = [
    new Origin(new Vec3(-214, -1198, 619), new Euler(0, 0, 0)),
    new Origin(new Vec3(2313, -1421, 286), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1355, -4511, 1194), new Euler(0, 0, 0)),
    new Origin(new Vec3(-2430, -3206, 1066), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1476, -2570, 1149), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1995, -1654, 1219), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1671, -1338, 1641), new Euler(0, 0, 0)),
    new Origin(new Vec3(-1765, -554, 1339), new Euler(0, 270, 0)),
    new Origin(new Vec3(-2414, -3639, 1391), new Euler(0, 0, 0)),
    new Origin(new Vec3(-2610, -958, 1600), new Euler(0, 270, 0)),
    new Origin(new Vec3(-2207, -3605, 1878), new Euler(0, 0, 0)),
    new Origin(new Vec3(-6450, -193, 2126), new Euler(0, 0, 0)),
    new Origin(new Vec3(-7280, -2871, 2013), new Euler(0, 0, 0)),
];
let item_origin_temp;
const sleep_wind_origin = [
    new Origin(new Vec3(-1596, -964, 1089), new Euler(0, 270, 0)),
    new Origin(new Vec3(-1992, -2848, 1490), new Euler(0, 0, 0)),
    new Origin(new Vec3(2020, -2718, 88), new Euler(0, 0, 0)),
    new Origin(new Vec3(-4794, -4080, 1880), new Euler(0, 0, 0)),
    new Origin(new Vec3(-5188, -1476, 1992), new Euler(0, 270, 0)),
    new Origin(new Vec3(-6768, -1680, 1651), new Euler(0, 0, 0)),
];
let sleep_wind_origin_temp;
Instance.OnScriptInput("SpawnHumanItems", () => {
    // Electro or Fire
    let t;
    let origin;
    if (Math.random() < 0.5) {
        t = Instance.FindEntityByName("Item_Electro_Temp1");
    }
    else {
        t = Instance.FindEntityByName("Item_Fire_Temp");
    }
    origin = item_origin_temp[getRandomInt(0, item_origin_temp.length - 1)];
    item_origin_temp = item_origin_temp.filter(o => o !== origin);
    t.ForceSpawn(origin.origin, origin.angle);
    // Bio
    t = Instance.FindEntityByName("Item_Bio_Temp1");
    origin = item_origin_temp[getRandomInt(0, item_origin_temp.length - 1)];
    item_origin_temp = item_origin_temp.filter(o => o !== origin);
    t.ForceSpawn(origin.origin, origin.angle);
    // Heal
    t = Instance.FindEntityByName("Item_Heal_Temp");
    origin = item_origin_temp[getRandomInt(0, item_origin_temp.length - 1)];
    item_origin_temp = item_origin_temp.filter(o => o !== origin);
    t.ForceSpawn(origin.origin, origin.angle);
    // Earth or Gravity
    if (Math.random() < 0.5) {
        t = Instance.FindEntityByName("Item_Earth_Temp1");
    }
    else {
        t = Instance.FindEntityByName("Item_Gravity_Temp1");
    }
    origin = item_origin_temp[getRandomInt(0, item_origin_temp.length - 1)];
    item_origin_temp = item_origin_temp.filter(o => o !== origin);
    t.ForceSpawn(origin.origin, origin.angle);
});
Instance.OnScriptInput("SpawnSleepWind", () => {
    let t;
    if (Math.random() < 0.5) {
        t = Instance.FindEntityByName("Item_Sleep_Temp1");
    }
    else {
        t = Instance.FindEntityByName("Item_Wind_Temp");
    }
    const origin = sleep_wind_origin_temp[getRandomInt(0, sleep_wind_origin_temp.length - 1)];
    t.ForceSpawn(origin.origin, origin.angle);
});
Instance.OnScriptInput("SpawnZMPoison", () => {
    const t = Instance.FindEntityByName("Weapon_Z_Poison_Temp");
    t.ForceSpawn(new Vec3(-2118, -734, 1232));
});
const zm_fire_ice_origin = [
    new Vec3(6192, -1727, 232),
    new Vec3(6128, -3336, 228),
];
let zm_fire_ice_origin_temp = [...zm_fire_ice_origin];
Instance.OnScriptInput("SpawnZMFire", () => {
    const t = Instance.FindEntityByName("Weapon_Z_Fire_Temp");
    if (zm_fire_ice_origin_temp.length === 0) {
        zm_fire_ice_origin_temp = [...zm_fire_ice_origin];
    }
    const origin = zm_fire_ice_origin_temp[getRandomInt(0, zm_fire_ice_origin_temp.length - 1)];
    zm_fire_ice_origin_temp = zm_fire_ice_origin_temp.filter(o => o !== origin);
    t.ForceSpawn(origin);
});
Instance.OnScriptInput("SpawnZMIce", () => {
    const t = Instance.FindEntityByName("Weapon_Z_Ice_Temp");
    if (zm_fire_ice_origin_temp.length === 0) {
        zm_fire_ice_origin_temp = [...zm_fire_ice_origin];
    }
    const origin = zm_fire_ice_origin_temp[getRandomInt(0, zm_fire_ice_origin_temp.length - 1)];
    zm_fire_ice_origin_temp = zm_fire_ice_origin_temp.filter(o => o !== origin);
    t.ForceSpawn(origin);
});
const zm_confuse_origin = [
    new Vec3(3272, -3390, 124),
    new Vec3(-2280, -2132, 1685)
];
Instance.OnScriptInput("SpawnZMConfuse", () => {
    const t = Instance.FindEntityByName("Item_Z_Confuse_itemtemp");
    const origin = zm_confuse_origin[getRandomInt(0, zm_confuse_origin.length - 1)];
    t.ForceSpawn(origin);
});
Instance.OnScriptInput("ConfuseOverlay", (data) => {
    const activator = data.activator;
    const t = data.caller;
    const e = t.ForceSpawn(activator.GetAbsOrigin());
    e[0].SetParent(activator);
});
Instance.OnScriptInput("StripKnife", (data) => {
    const activator = data.activator;
    activator.DestroyWeapon(activator.FindWeaponBySlot(CSGearSlot$1.KNIFE));
});
let grenade_given = [];
Instance.OnScriptInput("GiveGrenade", (data) => {
    const activator = data.activator;
    if (grenade_given.includes(activator))
        return;
    const destroyed_grenades = [];
    let grenade = activator.FindWeaponBySlot(CSGearSlot$1.GRENADES);
    while (grenade !== undefined) {
        const className = grenade.GetClassName();
        if (className === "weapon_hegrenade") {
            for (const grenade of destroyed_grenades) {
                activator.GiveNamedItem(grenade, false);
            }
            return;
        }
        activator.DestroyWeapon(grenade);
        destroyed_grenades.push(className);
        grenade = activator.FindWeaponBySlot(CSGearSlot$1.GRENADES);
    }
    for (const grenade of destroyed_grenades) {
        activator.GiveNamedItem(grenade, false);
    }
    activator.GiveNamedItem("weapon_hegrenade", false);
    grenade_given.push(activator);
});
// OTHER STUFF \\
Instance.OnScriptInput("Alpha", (data) => {
    for (let i = 0; i <= 200; i++) {
        EntFireTarget(data.caller, "Alpha", Math.floor((1 - (i / 200)) * 255), i / 100);
    }
});
Instance.OnScriptInput("SetOrigin", (data) => {
    data.caller.Teleport({ position: data.activator.GetAbsOrigin(), angles: new Euler(0, 0, 0) });
});
const minion_origin = [
    new Vec3(-1752, 5800, 568),
    new Vec3(-2040, 5800, 568),
    new Vec3(-1860, 5800, 568),
];
let minion_origin_temp = [...minion_origin];
Instance.OnScriptInput("Spawn1Minion", (data) => {
    const t = data.caller;
    if (minion_origin_temp.length === 0) {
        minion_origin_temp = [...minion_origin];
    }
    const origin = minion_origin_temp[getRandomInt(0, minion_origin_temp.length - 1)];
    minion_origin_temp = minion_origin_temp.filter(o => o !== origin);
    t.ForceSpawn(origin);
});
const minion_2_origin = [
    new Vec3(-1752, 5800, 568),
    new Vec3(-1860, 5800, 568),
    new Vec3(-2040, 5800, 568),
    new Vec3(-1752, 5800, 568)
];
let minion_2_origin_temp = [...minion_2_origin];
Instance.OnScriptInput("Spawn2Minion", (data) => {
    const t = data.caller;
    if (minion_2_origin_temp.length === 0) {
        minion_2_origin_temp = [...minion_2_origin];
    }
    let origin1;
    let origin2;
    if (minion_2_origin_temp.length > 2) {
        if (Math.random() < 0.5) {
            origin1 = minion_2_origin_temp[0];
            origin2 = minion_2_origin_temp[1];
        }
        else {
            origin1 = minion_2_origin_temp[2];
            origin2 = minion_2_origin_temp[3];
        }
    }
    else {
        origin1 = minion_2_origin_temp[0];
        origin2 = minion_2_origin_temp[1];
    }
    minion_2_origin_temp = minion_2_origin_temp.filter(o => (o !== origin1) && (o !== origin2));
    t.ForceSpawn(origin1);
    setTimeout(() => {
        t.ForceSpawn(origin2);
    }, 6 * 1000);
});
const fireball_origin = [
    new Vec3(8996, 9167, 223),
    new Vec3(9142, 9166, 223),
    new Vec3(9282, 9168, 223),
];
Instance.OnScriptInput("SpawnFireball", (data) => {
    const t = data.caller;
    const o = fireball_origin[getRandomInt(0, fireball_origin.length - 1)];
    t.ForceSpawn(o);
});
const ifrit_laser_origin = [
    // new Vec3(9136, 10184, 228),
    new Vec3(9136, 10184, 216),
    new Vec3(9136, 10184, 204),
    new Vec3(9136, 10184, 191),
];
Instance.OnScriptInput("SpawnIfritLaser", (data) => {
    const t = data.caller;
    const o = ifrit_laser_origin[getRandomInt(0, ifrit_laser_origin.length - 1)];
    t.ForceSpawn(o);
});
let zm_immunity = false;
Instance.OnScriptInput("ZMImmunity", () => {
    zm_immunity = true;
});
Instance.OnScriptInput("ResetZMImmunity", () => {
    zm_immunity = false;
});
let trigger_hurt_immunity_players = [];
let item_heal_immunity_players = [];
Instance.OnModifyPlayerDamage((event) => {
    if (warmup) {
        return { abort: true };
    }
    if (zm_immunity) {
        if (event.player.GetTeamNumber() === Team.T) {
            return { abort: true };
        }
    }
    if (event.player.GetTeamNumber() === Team.CT) {
        if (event.inflictor?.GetClassName() === "trigger_hurt" && trigger_hurt_immunity_players.includes(event.player) ||
            event.attacker?.GetTeamNumber() === Team.T && item_heal_immunity_players.includes(event.player)) {
            return { abort: true };
        }
    }
    if (event.inflictor?.GetClassName() === "prop_physics") {
        return { abort: true };
    }
});
Instance.OnScriptInput("HumanHealth", (data) => {
    const p = data.activator;
    p.SetMaxHealth(200);
    p.SetHealth(200);
    item_heal_immunity_players.push(p);
    setTimeout(() => {
        item_heal_immunity_players = item_heal_immunity_players.filter(e => e !== p);
    }, 7 * 1000);
});
Instance.OnScriptInput("RemoveHumanDmgFilter", () => {
    clearHealList();
});
function clearHealList() {
    item_heal_immunity_players = [];
}
Instance.OnScriptInput("TriggerHurtImmunity", (data) => {
    const p = data.activator;
    trigger_hurt_immunity_players.push(p);
    setTimeout(() => {
        trigger_hurt_immunity_players = trigger_hurt_immunity_players.filter(e => e !== p);
    }, 0.4 * 1000);
});
let boss_health = 1;
Instance.OnScriptInput("ConnectHealthOutputs", (data) => {
    Instance.ConnectOutput(data.caller, "OnGetValue", (inputData) => {
        boss_health = Number(inputData.value);
    });
    Instance.ConnectOutput(data.caller, "OutValue", (inputData) => {
        updateHealthBar(Number(inputData.value));
    });
});
function updateHealthBar(health) {
    const p = health / boss_health;
    let n = Math.floor((1 - p) * 16);
    EntFire("Boss_HP_Bar", "setalphascale", n < 0 ? 0 : n);
    EntFire("Ifrit_HP_Bar", "setalphascale", n < 0 ? 0 : n);
}
Instance.OnScriptInput("AddScore100", (data) => {
    const p = data.activator;
    p.GetPlayerController().AddScore(100);
});
Instance.OnScriptInput("AddScore150", (data) => {
    const p = data.activator;
    p.GetPlayerController().AddScore(150);
});
Instance.OnScriptInput("AddScore250", (data) => {
    const p = data.activator;
    p.GetPlayerController().AddScore(250);
});
Instance.OnScriptInput("AddScore1000", (data) => {
    const p = data.activator;
    p.GetPlayerController().AddScore(1000);
});
Instance.OnScriptInput("RenameTrigger", (data) => {
    data.caller.SetEntityName("Map_All_Hurt");
});
// BOSS MOVEMENT \\
class Boss {
    PHYSBOX;
    TICKRATE = 0.02;
    ANGULAR_VEL = 225;
    FORWARD_VEL_SCALE = 400;
    FRONT_ANGLE = 5;
    FORWARD_TIMEOUT = 0.75;
    ACCEL_MAX = 1;
    target = undefined;
    forward_timeout = this.FORWARD_TIMEOUT;
    accel_time = 0;
    constructor(handle) {
        this.PHYSBOX = handle;
        this.Tick();
    }
    Tick() {
        if (this.target === undefined || !this.target.IsValid() || this.target.GetTeamNumber() !== Team.CT || this.target.GetHealth() <= 0) {
        }
        else {
            const self_origin = this.PHYSBOX.GetAbsOrigin();
            const self_angle = new Euler(this.PHYSBOX.GetAbsAngles());
            const target_origin = this.target.GetAbsOrigin();
            const abs_angle_rad = Math.atan2(target_origin.y - self_origin.y, target_origin.x - self_origin.x);
            const abs_angle_deg = atan2Deg(abs_angle_rad);
            const local_angle_deg = wrapDeg(abs_angle_deg, self_angle.yaw);
            const forward_vec = self_angle.forward;
            if (local_angle_deg > this.FRONT_ANGLE) {
                if (traceLine(self_origin, Vector3Utils.add(self_origin, forward_vec.scale(24))).didHit) {
                    this.forward_timeout = 0;
                    this.accel_time = 0;
                }
                this.PHYSBOX.Teleport({ angularVelocity: new Vec3(0, 0, this.ANGULAR_VEL) });
            }
            else if (local_angle_deg < -this.FRONT_ANGLE) {
                if (traceLine(self_origin, Vector3Utils.add(self_origin, forward_vec.scale(24))).didHit) {
                    this.forward_timeout = 0;
                    this.accel_time = 0;
                }
                this.PHYSBOX.Teleport({ angularVelocity: new Vec3(0, 0, -this.ANGULAR_VEL) });
            }
            this.forward_timeout += this.TICKRATE;
            if (this.forward_timeout > this.FORWARD_TIMEOUT) {
                this.accel_time += this.TICKRATE;
                const scale = this.FORWARD_VEL_SCALE * (this.accel_time > this.ACCEL_MAX ? 1 : (this.accel_time / this.ACCEL_MAX));
                this.PHYSBOX.Teleport({ velocity: new Vec3(forward_vec.x * scale, forward_vec.y * scale, 0) });
            }
        }
        if (genesis_stop)
            return;
        setTimeout(() => {
            this.Tick();
        }, this.TICKRATE * 1000);
    }
}
let genesis;
Instance.OnScriptInput("StartGenesis", (data) => {
    genesis = new Boss(data.caller);
});
let genesis_stop = false;
Instance.OnScriptInput("StopGenesis", () => {
    genesis_stop = true;
});
Instance.OnScriptInput("GenesisAccelReset", () => {
    genesis.accel_time = 0;
});
Instance.OnScriptInput("GenesisTarget", (data) => {
    genesis.target = data.activator;
    genesis.accel_time = 0.75;
});
// HELPER FUNCTIONS \\
function EntFire(name, input, value, delay, activator, caller) {
    Instance.EntFireAtName({ name: name, input: input, value: value, delay: delay, activator: activator, caller: caller });
}
function EntFireTarget(target, input, value, delay, activator, caller) {
    Instance.EntFireAtTarget({ target: target, input: input, value: value, delay: delay, activator: activator, caller: caller });
}
/** Removes the item from the list and returns the new list */
function removeItem(item, item_list) {
    return item_list = item_list.filter(i => i !== item);
}
function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
function atan2Deg(radians) {
    const degrees = radians * (180 / Math.PI); // convert to degrees
    return degrees;
}
function wrapDeg(a, y) {
    let degrees = a - y;
    // Normalize to [-180, 180)
    degrees = ((degrees + 180) % 360 + 360) % 360 - 180;
    return degrees;
}
function traceLine(start, target) {
    let ents = Instance.FindEntitiesByClass("*");
    ents = ents.filter(e => e.GetClassName() !== "worldent" && e.GetClassName() !== "func_clip_vphysics");
    const trace_result = Instance.TraceLine({ start: start, end: target, ignorePlayers: true, ignoreEntity: ents });
    return trace_result;
}
Instance.SetNextThink(Instance.GetGameTime());
Instance.SetThink(() => {
    Instance.SetNextThink(Instance.GetGameTime());
    runSchedulerTick();
});
