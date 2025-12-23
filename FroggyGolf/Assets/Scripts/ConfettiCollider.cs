using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConfettiCollider : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    [SerializeField] private Animator anim;

    private void OnTriggerEnter(Collider other)
    {
        other.enabled = false;
        Animator anim = GetComponent<Animator>();
        anim.SetTrigger("onEnter");
    }
}
