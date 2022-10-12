using UnityEngine;

public class Raycasting : MonoBehaviour
{
    private const float CUBE_SPEED = 0.01f;
    private const int RAY_LENGTH = 5;
    private const string TARGET_TAG = "Target";

    public GameObject Cube;

    private float _cubeSpeed;
    private RaycastHit _hitObject;
    private float _rayLength;
    private float _cameraRayLength;

    private void InitializeValues()
    {
        _cubeSpeed = CUBE_SPEED;
        _rayLength = RAY_LENGTH;
        _cameraRayLength = RAY_LENGTH * 10;
    }

    void Start()
    {
        InitializeValues();
    }

    void Update()
    {
        Vector3 oldPos = Cube.transform.position;

        PositionUpdate(oldPos);

        Vector3 newPos = Cube.transform.position;

        //CubeRaycast(newPos);
        CameraRaycast();
    }

    void PositionUpdate(Vector3 oldPos)
    {
        if (Input.GetKey(KeyCode.A))
        {
            Cube.transform.position = (new Vector3(oldPos.x - _cubeSpeed, oldPos.y, oldPos.z));
        }

        if (Input.GetKey(KeyCode.D))
        {
            Cube.transform.position = (new Vector3(oldPos.x + _cubeSpeed, oldPos.y, oldPos.z));
        }
    }

    void CubeRaycast(Vector3 newPos)
    {
        if (Physics.Raycast(newPos, Cube.transform.right, out _hitObject, _rayLength))
        {
            Debug.DrawRay(newPos, Cube.transform.right * _rayLength, Color.green, 0.0f);

            if (_hitObject.collider.tag == TARGET_TAG)
            {
                Debug.Log("Hit");
            }
        }        
    }

    void CameraRaycast()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);

        if (Physics.Raycast(ray, out _hitObject, _cameraRayLength))
        {
            _hitObject.transform.Rotate(new Vector3(0f, 0.5f, 0f));
        }
    }
}
